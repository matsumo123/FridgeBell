module FoodActions
  class DiscardsController < ApplicationController
    before_action :authenticate_user!
    before_action :user_foods_present?, only: %i[ new ]
    def new
      @form = Form::FoodActionCollection.new(current_user)
    end

    def create
      @form = Form::FoodActionCollection.new(current_user, collection_params)
      if @form.save
        redirect_to home_path, notice: "食材を廃棄しました"
      else
        flash.now[:alert] = "食材を廃棄できませんでした"
        @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)  
        render :consume, status: :unprocessable_entity
      end
    end

    private

    def collection_params
      params.require(:form_food_action_collection).permit(food_actions_attributes: [:user_food_id, :action_type, :action_date, :quantity, :availability])
    end

    def user_foods_present?
      @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
      unless @user_foods.present?
        redirect_to home_path, alert: "冷蔵庫に登録されている食材がありません。まずは食材を追加してください。"
      end
    end
  end
end
