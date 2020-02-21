class PetsController < ApplicationController

  def index
    @pets = Pet.all

    if params[:query].present?
      sql_query = "species ILIKE :query"
      @pets = Pet.where(sql_query, query: "%#{params[:query]}%")
    else
      @pets = Pet.all
    end

  #   @user = current_user
  #   @users = User.geocoded # returns flats with coordinates

  #   @users.each do |user|

  #     @markers = @users.map do |user|
  #       {
  #         lat: user.latitude,
  #         lng: user.longitude,
  #         infoWindow: render_to_string(partial: "info_window", locals: { user: user })
  #     }
  #   end
  # end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new()
  end

  def create
    @pet = Pet.new(pets_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to dashboard_path
  end

  def change_status
    @pet = Pet.find(params[:id])
    @pet.status = !@pet.status
    @pet.save
    redirect_to dashboard_path
  end


  private
  def pets_params
    params.require(:pet).permit(:name, :description, :price, :pedigree, :species, :skill, photos: [])
  end

end
