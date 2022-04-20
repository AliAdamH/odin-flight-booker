# Project - Flight Booker

This project is part of the **Odin Project** curriculum.
[Link to the full description](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker)

<br>


## **Takeaway** :

This project's goal was to practice advanced forms with rails, i.e : Nested forms.

The app's data model is made of four Models :

* Airport
* Flight
* Booking
* Passenger

<br>

The most interesting part of the project was using a nested form for creating a **Booking**, and at the same time create the associated **Passengers**.

To submit and save data for two associated models, we've added the special method `accepts_nested_attributes_for :passengers` to the Booking model since it has *many* passengers, and a passenger *belongs to* one Booking.


<br>

```ruby
# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
```

```ruby
# app/models/passenger.rb
class Passenger < ApplicationRecord
  belongs_to :booking
end
```

<br>
<br>

### **Controller** :

<br>

When a user searches for an available flight, finds and submits the flight to book. (Calling the new Action of the BookingsController )
We use the params sent to build our booking form, in three steps :

1. We search for the flight to display it's informations and use its id in the form.  

2. We initialize a new Booking object.  

3. We use the new booking object to build as many passengers objects that the user wants.

<br>

```ruby
# app/controllers/bookings_controller.rb
  def new
    # step 1
    @flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_id])

    # step 2
    @booking = Booking.new

    # step 3
    params[:num_tickets].to_i.times do
       @booking.passengers.build
    end
  end 
```

<br>
<br>

### **View** :

<br>

We render our form using `form_with model: @booking...`, and to nest the passenger inside of it we use `form.fields_for :passengers...`

```ruby
... 
<%= form_with model: @booking do |f| %>
                <%= f.hidden_field :flight_id, value: @flight.id %>
                <%= render partial: 'info', locals: { flight: @flight} %>
                ...
                            <%= f.fields_for :passengers do |passenger_form| %>
                            ...
                            ...
```

<br>
<br>

### **When the form is submitted** :

<br>

The params hash will contain the attributes for the booking object as well as
the attributes for the passenger objects :
```
...
Processing by BookingsController#create as HTML
  Parameters: {"authenticity_token"=>"[FILTERED]",
                "booking"=>{"flight_id"=>"1",
                 "passengers_attributes"=>
                 {"0"=>{"name"=>"foobar", "email"=>"foo@bar.com"},
                  "1"=>{"name"=>"barfoo", "email"=>"bar@foo.com"}
                  }},
                   "commit"=>"Apply"}
```


We previously permitted the passenger_attributes hash  `passenger_attributes: %i[name email]` in the `#booking_params` method, therefore we can simply call for the instantiation of a booking using `Booking.new(booking_params)` and then saving it.

<br>
<br>

## Other Notes

<br>

Later on the curriculum, another task related to this project was to [send confirmation emails to each passenger](https://www.theodinproject.com/lessons/ruby-on-rails-sending-confirmation-emails) when a booking has been successful. This was done by generating a `PassengerMailer` in which we defined a `#success_email` method that we call upon the creation of a booking (with it's respective passengers)

```ruby
# app/controllers/bookings_controller.rb
# BookingsController#create
 @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).success_email.deliver_later
      end
```
