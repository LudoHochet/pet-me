class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new

    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    price = (@booking.end_date - @booking.start_date).to_i * @pet.price
    @booking.price = price
    @booking.pet = @pet
    @booking.status = 'pending'
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


  def accept
    @booking = Booking.find(params[:id])
    @booking.status = 'accept'
    @booking.save
    redirect_to dashboard_path
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.status = 'deny'
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :description)
  end
end

