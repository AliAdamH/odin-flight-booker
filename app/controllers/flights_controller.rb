class FlightsController < ApplicationController


  def index
    @airports = Airport.all.order(:code)
  end

end