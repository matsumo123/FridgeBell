class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :user_foods, dependent: :destroy
  has_many :food_actions, dependent: :destroy
  has_one :user_character, dependent: :destroy
  has_one :reminder, dependent: :destroy
  after_create :set_user_character
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  validates :name, presence: true, length: { maximum: 255 }
  validates :password, complex_password: true

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  private

  def set_user_character
    create_user_character!(character_id: Character.find_by(stage_number: 0).id, consecutive_days: 0, last_action_at: nil)
  end
end
