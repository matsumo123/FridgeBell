class Category < ApplicationRecord
  has_many :foods

  validates :name, presence: true

  ORDER = [ "野菜", "きのこ", "肉", "魚介・海藻", "卵・乳", "穀・豆", "加工品", "果物", "その他" ]

  scope :custom_order, -> { all.sort_by { |c| ORDER.index(c.name) || ORDER.size } }
end
