class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'


  def self.available_flights(day:, month:, year:, departure:, arrival:)
    formatted_time = Time.new(year, month, day)
    where(
      departure_airport_id: departure,
      arrival_airport_id: arrival,
      start: formatted_time..(formatted_time + 1.day).midnight
    )
  end
end
