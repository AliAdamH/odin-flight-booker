class PassengerMailer < ApplicationMailer

  def success_email
    @passenger = params[:passenger]
    mail(
      to: @passenger.email, subject: 'You have booked a flight !'
    )
  end
end
