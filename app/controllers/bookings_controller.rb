class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @pet = Pet.find([params[:id]])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @booking.status = false
    @booking.user = current_user
    if @booking.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.update(booking_params)
    redirect_to pet_path(@booking.pet)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :description)

end

