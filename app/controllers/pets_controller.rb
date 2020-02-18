class PetsController < ApplicationController

def index
  @pets = Pet.all
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

private

def pets_params
  params.require(:pet).permit(:name, :description, :price, :pedigree, :species, :skill, :photos)
end

end
