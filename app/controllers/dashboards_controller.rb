class DashboardsController < ApplicationController
  def show
    @user = current_user
    @pets = current_user.pets.order("created_at")
    @my_bookings = current_user.bookings
    @my_rented_pets = Booking.where(pet_id: current_user.pet_ids)
  end
end
