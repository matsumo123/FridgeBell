class FavoritesController < ApplicationController
 before_action :authenticate_user!
  def create
    food = Food.find(params[:food_id])
    current_user.favorite(food)
    redirect_to new_user_food_path(category_id: params[:category_id], page: params[:page]),
      notice: "お気に入りに登録しました"
  end

  def destroy
    food = current_user.favorites.find(params[:id]).food
    current_user.unfavorite(food)
    redirect_to new_user_food_path(category_id: params[:category_id], page: params[:page]),
      notice: "お気に入りから削除しました"
  end
end
