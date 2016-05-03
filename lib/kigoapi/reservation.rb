module KigoAPI
    class Reservation
        attr_reader :id

        attr_accessor :check_in
        attr_accessor :check_out
        attr_accessor :prop_id
        attr_accessor :status

        attr_accessor :adults
        attr_accessor :children
        attr_accessor :babies

        attr_accessor :comment
        attr_accessor :comment_guest

        attr_accessor :guest
        attr_accessor :payment
        attr_accessor :ob

        attr_accessor :udra
        attr_accessor :booking_source

        def initialize(reservations, reservation_data=nil)
            @_reservations = reservations

            @udra = {}
            @guest = KigoAPI::Reservation::Guest.new

            udras = KigoAPI::UserDefinedReservationAttributes.list

            udras.each do |udra|
              if udra
                @udra[udra.to_sym] = udra.clone
              end
            end

            if reservation_data
                @id = reservation_data[:RES_ID]

                @check_in = reservation_data[:RES_CHECK_IN]
                @check_out = reservation_data[:RES_CHECK_OUT]
                @prop_id = reservation_data[:PROP_ID]

                @adults = reservation_data[:RES_N_ADULTS]
                @children = reservation_data[:RES_N_CHILDREN]
                @babies = reservation_data[:RES_N_BABIES]

                @comment = reservation_data[:RES_COMMENT]
                @comment_guest = reservation_data[:RES_COMMENT_GUEST]

                @guest.lastname = reservation_data[:RES_GUEST_LASTNAME]
                @guest.firstname = reservation_data[:RES_GUEST_FIRSTNAME]
                @guest.email = reservation_data[:RES_GUEST_EMAIL]
                @guest.phone = reservation_data[:RES_GUEST_PHONE]
                @guest.country = reservation_data[:RES_GUEST_COUNTRY]

                @payment = KigoAPI::Reservation::Payment.new(reservation_data[:PMT_G2RA])

                if reservation_data[:OB]
                  @ob = KigoAPI::Reservation::Booking.new(reservation_data[:OB])
                end

                if reservation_data[:RES_UDRA]
                    reservation_data[:RES_UDRA].each do |i|
                        udra = KigoAPI::UserDefinedReservationAttributes.find(i[:UDRA_ID])
                        if udra
                          @udra[udra.to_sym].value = udra.value
                        end
                    end
                end

                @booking_source = KigoAPI::BookingSources.find(reservation_data[:BOOKING_SOURCE_ID])
            end
        end

        def udra(name)
            return @udra[name]
        end

        def set_udra(name, value)
            if @udra[name]
                @udra[name].value = value
            end
        end

        def guests
            @adults + @children + @babies
        end

        def save
            if @id
                @_reservations.update(self)
            else
                @_reservations.create(self)
            end
        end

        def as_json(options=nil)
            {
                :RES_ID => self.id,
                :RES_PROP_ID => self.prop_id,
                :RES_CHECK_IN => self.check_in,
                :RES_CHECK_OUT => self.check_out,
                :RES_N_ADULTS => self.adults,
                :RES_N_CHILDREN => self.children,
                :RES_N_BABIES => self.babies,
                :RES_COMMENT => self.comment,
                :RES_COMMENT_GUEST => self.comment_guest,
                :RES_GUEST => self.guest,
                :OB => self.ob,
                :PAYMENT => self.payment,
                :RES_UDRA => @udra.map do |sym, udra|
                    udra.as_json
                end
            }
        end
    end
end
