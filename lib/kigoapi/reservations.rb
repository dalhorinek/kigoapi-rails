module KigoAPI
    class Reservations

        def self.create(reservation)

        end


        def self.get(id)
            response = KigoAPI::Client.post("readReservation", { :RES_ID => id })

            unless response.data 
                raise 'No such reservation'
            else
                KigoAPI::Reservation.new self, response.data
            end
        end

        def self.update(reservation)
            response = KigoAPI::Client.post("updateReservation", reservation)
            return response.ok
        end

        def self.create(reservation)
            response = KigoAPI::Client.post("createConfirmedReservation", reservation)
            return response.ok
        end
    end
end