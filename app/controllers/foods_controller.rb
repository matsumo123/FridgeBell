class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.order(name: :asc) 
  end

  def new; end

  def create; end

end
