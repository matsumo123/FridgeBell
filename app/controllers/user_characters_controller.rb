class UserCharactersController < ApplicationController
  before_action :authenticate_user!
  def character_stage
    @character_stage = current_user.user_character
  end
end
