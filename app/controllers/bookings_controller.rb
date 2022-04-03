class BookingsController < ApplicationController


  def show
    @booking = Booking.find(params[:id])
  end



  def new
    @flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_id])
    @booking = Booking.new
    params[:num_tickets].to_i.times do
       @booking.passengers.build
    end
  end 


  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'You have succesfully booked your flight'
    else
      render :new
    end 
  end


  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end