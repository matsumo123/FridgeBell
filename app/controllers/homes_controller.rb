class HomesController < ApplicationController
  before_action :authenticate_user!, only: %i[ home ]

  def top; end

  def home; end
end
