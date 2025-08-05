class Character < ApplicationRecord
  has_one_attached :image
  validates :stage_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 50 }
  validate :image_content_type
  validate :image_size

  def image_content_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:image, ":ファイル形式がJPEG, PNG, WebP以外になっています。ファイル形式をご確認ください。")
    end
  end

  def image_size
    if image.attached? && image.blob.byte_size > 5.megabytes
      errors.add(:image, ":5MB以下のファイルをアップロードしてください。")
    end
  end
end
