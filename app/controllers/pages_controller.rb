class PagesController < ApplicationController
  def home
    # @user = current_user
    # @users = User.geocoded # returns flats with coordinates

    # @markers = @users.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { user: user })
    #   }
    # end
  end
end
