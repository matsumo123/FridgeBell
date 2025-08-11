class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character
  validates :user_id, :character_id, presence: true
  validates :consecutive_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # すでに今日、消費済みか
  def consumed_today?(at = Time.current)
    ts = last_consumed_at
    return false unless ts
    (at.beginning_of_day..at.end_of_day).cover?(ts)
  end

  # action_typeが消費の際は更新
  def apply_consumption!(at = Time.current)
    update!(
      character_id: next_character_id,
      consecutive_days: consecutive_days + 1,
      last_consumed_at: at
    )
  end

  # action_typeが廃棄の際はリセット
  def apply_discard!
    update!(
      consecutive_days: 0,
      last_consumed_at: nil
    )
  end

  private

  # characterのステージは8ステージ以内
  def next_character_stage
    [ consecutive_days + 1, 8 ].min
  end

  # ステージに沿ったcharacter_idを取得
  def next_character_id
    Character.find_by!(stage_number: next_character_stage).id
  end
end
