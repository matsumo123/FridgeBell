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

vegetables = [
  { name: "トマト", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_トマト.png" },
  { name: "ミニトマト", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_ミニトマト.png" },
  { name: "きゅうり", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_きゅうり.png" },
  { name: "なす", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_なす.png" },
  { name: "ピーマン", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ピーマン.png" },
  { name: "パプリカ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_パプリカ.png" },
  { name: "しし唐", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ししとう.png" },
  { name: "かぼちゃ", quantity: "1/4", unit: "個", default_deadline: 5, file: "野菜類_かぼちゃ.png" },
  { name: "ゴーヤ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ゴーヤ.png" },
  { name: "オクラ", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_オクラ.png" },
  { name: "いんげん", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_いんげん.png" },
  { name: "ズッキーニ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ズッキ-ニ.png" },
  { name: "絹さや", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_さやえんどう.png" },
  { name: "スナップエンドウ", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_スナップえんどう.png" },
  { name: "そら豆", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_そら豆.png" },
  { name: "グリンピース", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_グリンピース.png" },
  { name: "キャベツ", quantity: "1/4", unit: "個", default_deadline: 5, file: "野菜類_キャベツ.png" },
  { name: "白菜", quantity: "1/4", unit: "個", default_deadline: 5, file: "野菜類_はくさい.png" },
  { name: "ほうれん草", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_ほうれんそう.png" },
  { name: "小松菜", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_小松菜.png" },
  { name: "チンゲン菜", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_チンゲンサイ.png" },
  { name: "春菊", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_しゅんぎく.png" },
  { name: "ニラ", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_ニラ.png" },
  { name: "水菜", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_みずな.png" },
  { name: "三つ葉", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_みつば.png" },
  { name: "セロリ", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_セロリ.png" },
  { name: "レタス", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_レタス.png" },
  { name: "サニーレタス", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_サニーレタス.png" },
  { name: "クレソン", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_クレソン.png" },
  { name: "ブロッコリー", quantity: "1", unit: "株", default_deadline: 5, file: "野菜類_ブロッコリー.png" },
  { name: "カリフラワー", quantity: "1", unit: "株", default_deadline: 5, file: "野菜類_カリフラワー.png" },
  { name: "アスパラガス", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_アスパラガス.png" },
  { name: "玉ねぎ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_タマネギ.png" },
  { name: "長ネギ", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_長ねぎ.png" },
  { name: "葉ネギ", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_葉ねぎ.png" },
  { name: "もやし", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_もやし.png" },
  { name: "豆苗", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_豆苗.png" },
  { name: "かいわれ大根", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_かいわれだいこん.png" },
  { name: "たけのこ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_たけのこ.png" },
  { name: "せり", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_せり.png" },
  { name: "空心菜", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_くうしんさい.png" },
  { name: "モロヘイヤ", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_モロヘイヤ.png" },
  { name: "大根", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_だいこん.png" },
  { name: "かぶ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_かぶ.png" },
  { name: "にんじん", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_ニンジン.png" },
  { name: "じゃがいも", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ジャガイモ.png" },
  { name: "さつまいも", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_さつまいも.png" },
  { name: "長いも", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_ながいも.png" },
  { name: "里芋", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_さといも.png" },
  { name: "ごぼう", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_ごぼう.png" },
  { name: "レンコン", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_れんこん.png" },
  { name: "しそ", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_しそ.png" },
  { name: "みょうが", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_みょうが.png" },
  { name: "にんにく", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ニンニク.png" },
  { name: "しょうが", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_しょうが.png" },
  { name: "パセリ", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_パセリ.png" },
  { name: "パクチー", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_パクチー.png" },
  { name: "バジル", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_バジル.png" },
  { name: "ローズマリー", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_ローズマリー.png" }
]

vegetable_category = Category.find_by(name: "野菜")
vegetables.each do |data|
  vegetable = Food.find_or_initialize_by(name: data[:name], user_id: nil
  )
  vegetable.assign_attributes(
    category_id: vegetable_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    vegetable.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if vegetable.save
    puts "✅ 登録成功: #{vegetable.name}"
  else
    puts "❌ 登録失敗: #{vegetable.name}"
    puts food.errors.full_messages
  end
end

mushrooms = [
  { name: "しいたけ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_しいたけ.png" },
  { name: "ぶなしめじ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_ぶなしめじ.png" },
  { name: "えのき", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_えのきたけ.png" },
  { name: "エリンギ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_エリンギ.png" },
  { name: "まいたけ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_まいたけ.png" },
  { name: "なめこ", quantity: "1", unit: "袋", default_deadline: 5, file: "きのこ類_なめこ.png" },
  { name: "マッシュルーム", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_マッシュルーム.png" }
]

mushroom_category = Category.find_by(name: "きのこ")
mushrooms.each do |data|
  mushroom = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  mushroom.assign_attributes(
    category_id: mushroom_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    mushroom.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if mushroom.save
    puts "✅ 登録成功: #{mushroom.name}"
  else
    puts "❌ 登録失敗: #{mushroom.name}"
    puts food.errors.full_messages
  end
end
