class BookingsController < ApplicationController


  def new
    @flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_id])
    @booking = Booking.new
    params[:num_tickets].to_i.times do
       @booking.passengers.build
    end
  end 


  def create
    redirect_to root_path
  end
end