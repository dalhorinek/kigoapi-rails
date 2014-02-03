module KigoAPI
    class Reservation::Guest
        attr_accessor :lastname 
        attr_accessor :firstname 
        attr_accessor :email 
        attr_accessor :phone 
        attr_accessor :country

        def as_json 
            {
                :RES_GUEST_FIRSTNAME => self.firstname, 
                :RES_GUEST_LASTNAME => self.lastname, 
                :RES_GUEST_EMAIL => self.email, 
                :RES_GUEST_PHONE => self.phone, 
                :RES_GUEST_COUNTRY => self.country
            }
        end
    end
end