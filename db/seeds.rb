# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [
  { name: "野菜" },
  { name: "きのこ" },
  { name: "肉" },
  { name: "魚介・海藻" },
  { name: "卵・乳" },
  { name: "穀・豆・芋" },
  { name: "果物" },
  { name: "その他" }
]

categories.each do |category|
  Category.find_or_create_by(name: category[:name])
end
