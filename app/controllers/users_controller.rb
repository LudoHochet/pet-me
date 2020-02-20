class UsersController < ApplicationController

  def show
  @user = User.find(params[:id])
  # @user = current_user
  @markers =
    {
      lat: @user.latitude,
      lng: @user.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { user: @user })
    }
  end

end
