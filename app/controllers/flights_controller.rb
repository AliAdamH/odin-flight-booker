class FlightsController < ApplicationController


  def index
    @airports = Airport.all.order(:code)
    @flights_dates = Flight.all.order(:start).map(&:start)
    @days = @flights_dates.reduce(Set.new) { |acc, date| acc.add date.day }.sort
    @months = @flights_dates.reduce(Set.new) { |acc, date| acc.add date.month }
    @years = @flights_dates.reduce(Set.new) { |acc, date| acc.add date.year }
    @available_flights = Flight.available_flights(
      departure: params[:departure_code],
      arrival: params[:arrival_code],
      day: params[:day],
      month: params[:month],
      year: params[:year],
    ) if params[:commit]
  end

end