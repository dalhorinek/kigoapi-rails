# Kigoapi::Rails

Kigo API Implementation

## Installation

Add this line to your application's Gemfile:

    gem 'kigoapi-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kigoapi-rails

## Usage

Autorization 
    KigoAPI::Client.auth("username", "password")

Receive a reservation 
    reservation = KigoAPI::Reservations.get(id)

Change and update reservation 
    reservation.comment = "Some comment"
    reservation.save

User Defined Reservation Attributes
    value = reservation.udra(:name)

    reservation.set_udra(:name, "New value")

Guest object 
    guest = reservation.guest 

    guest.lastname = "Doe"


More is to come

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
