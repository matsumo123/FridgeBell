class FavoritesController < ApplicationController
 before_action :authenticate_user!
  def create
    @food = Food.find(params[:food_id])
    current_user.favorite(@food)
  end

  def destroy
    @food = current_user.favorites.find(params[:id]).food
    current_user.unfavorite(@food)
  end
end
