categories = [
  { name: "野菜" },
  { name: "きのこ" },
  { name: "肉" },
  { name: "魚介・海藻" },
  { name: "卵・乳" },
  { name: "穀・豆" },
  { name: "果物" },
  { name: "加工品" },
  { name: "その他" }
]

categories.each do |category|
  Category.find_or_initialize_by(name: category[:name])
  if category.save
    puts "✅ 登録成功: #{category.name}"
  else
    puts "❌ 登録失敗: #{category.name}"
  end
end

vegetables = [
  { name: "トマト", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_トマト.png" },
  { name: "ミニトマト", quantity: 1, unit: "パック", default_deadline: 7, file: "野菜類_ミニトマト.png" },
  { name: "きゅうり", quantity: 1, unit: "本", default_deadline: 10, file: "野菜類_きゅうり.png" },
  { name: "なす", quantity: 1, unit: "本", default_deadline: 7, file: "野菜類_なす.png" },
  { name: "ピーマン", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_ピーマン.png" },
  { name: "パプリカ", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_パプリカ.png" },
  { name: "しし唐", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_ししとう.png" },
  { name: "かぼちゃ", quantity: 1/4, unit: "個", default_deadline: 8, file: "野菜類_かぼちゃ.png" },
  { name: "ゴーヤ", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_ゴーヤ.png" },
  { name: "オクラ", quantity: 1, unit: "パック", default_deadline: 7, file: "野菜類_オクラ.png" },
  { name: "いんげん", quantity: 1, unit: "本", default_deadline: 7, file: "野菜類_いんげん.png" },
  { name: "ズッキーニ", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_ズッキ-ニ.png" },
  { name: "絹さや", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_さやえんどう.png" },
  { name: "スナップエンドウ", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_スナップえんどう.png" },
  { name: "そら豆", quantity: 1, unit: "袋", default_deadline: 3, file: "野菜類_そら豆.png" },
  { name: "グリンピース", quantity: 1, unit: "袋", default_deadline: 3, file: "野菜類_グリンピース.png" },
  { name: "キャベツ", quantity: 1/4, unit: "個", default_deadline: 7, file: "野菜類_キャベツ.png" },
  { name: "白菜", quantity: 1/4, unit: "個", default_deadline: 7, file: "野菜類_はくさい.png" },
  { name: "ほうれん草", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_ほうれんそう.png" },
  { name: "小松菜", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_小松菜.png" },
  { name: "チンゲン菜", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_チンゲンサイ.png" },
  { name: "春菊", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_しゅんぎく.png" },
  { name: "ニラ", quantity: 1, unit: "束", default_deadline: 7, file: "野菜類_ニラ.png" },
  { name: "水菜", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_みずな.png" },
  { name: "三つ葉", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_みつば.png" },
  { name: "セロリ", quantity: 1, unit: "本", default_deadline: 7, file: "野菜類_セロリ.png" },
  { name: "レタス", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_レタス.png" },
  { name: "サニーレタス", quantity: 1, unit: "個", default_deadline: 14, file: "野菜類_サニーレタス.png" },
  { name: "クレソン", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_クレソン.png" },
  { name: "ブロッコリー", quantity: 1, unit: "株", default_deadline: 10, file: "野菜類_ブロッコリー.png" },
  { name: "カリフラワー", quantity: 1, unit: "株", default_deadline: 7, file: "野菜類_カリフラワー.png" },
  { name: "アスパラガス", quantity: 1, unit: "束", default_deadline: 7, file: "野菜類_アスパラガス.png" },
  { name: "玉ねぎ", quantity: 1, unit: "個", default_deadline: 14, file: "野菜類_タマネギ.png" },
  { name: "長ネギ", quantity: 1, unit: "本", default_deadline: 10, file: "野菜類_長ねぎ.png" },
  { name: "葉ネギ", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_葉ねぎ.png" },
  { name: "もやし", quantity: 1, unit: "袋", default_deadline: 3, file: "野菜類_もやし.png" },
  { name: "豆苗", quantity: 1, unit: "袋", default_deadline: 7, file: "野菜類_豆苗.png" },
  { name: "かいわれ大根", quantity: 1, unit: "パック", default_deadline: 7, file: "野菜類_かいわれだいこん.png" },
  { name: "たけのこ", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_たけのこ.png" },
  { name: "せり", quantity: 1, unit: "束", default_deadline: 3, file: "野菜類_せり.png" },
  { name: "空心菜", quantity: 1, unit: "束", default_deadline: 3, file: "野菜類_くうしんさい.png" },
  { name: "モロヘイヤ", quantity: 1, unit: "袋", default_deadline: 3, file: "野菜類_モロヘイヤ.png" },
  { name: "大根", quantity: 1, unit: "本", default_deadline: 10, file: "野菜類_だいこん.png" },
  { name: "とうもろこし", quantity: 1, unit: "本", default_deadline: 3, file: "野菜類_とうもろこし.png" },
  { name: "かぶ", quantity: 1, unit: "個", default_deadline: 10, file: "野菜類_かぶ.png" },
  { name: "にんじん", quantity: 1, unit: "本", default_deadline: 14, file: "野菜類_ニンジン.png" },
  { name: "じゃがいも", quantity: 1, unit: "個", default_deadline: 28, file: "野菜類_ジャガイモ.png" },
  { name: "さつまいも", quantity: 1, unit: "本", default_deadline: 28, file: "野菜類_さつまいも.png" },
  { name: "長いも", quantity: 1, unit: "本", default_deadline: 7, file: "野菜類_ながいも.png" },
  { name: "里芋", quantity: 1, unit: "個", default_deadline: 14, file: "野菜類_さといも.png" },
  { name: "ごぼう", quantity: 1, unit: "本", default_deadline: 7, file: "野菜類_ごぼう.png" },
  { name: "レンコン", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_れんこん.png" },
  { name: "しそ", quantity: 1, unit: "パック", default_deadline: 14, file: "野菜類_しそ.png" },
  { name: "みょうが", quantity: 1, unit: "個", default_deadline: 7, file: "野菜類_みょうが.png" },
  { name: "にんにく", quantity: 1, unit: "個", default_deadline: 56, file: "野菜類_ニンニク.png" },
  { name: "しょうが", quantity: 1, unit: "個", default_deadline: 21, file: "野菜類_しょうが.png" },
  { name: "パセリ", quantity: 1, unit: "パック", default_deadline: 14, file: "野菜類_パセリ.png" },
  { name: "パクチー", quantity: 1, unit: "束", default_deadline: 14, file: "野菜類_パクチー.png" },
  { name: "バジル", quantity: 1, unit: "パック", default_deadline: 10, file: "野菜類_バジル.png" },
  { name: "ローズマリー", quantity: 1, unit: "パック", default_deadline: 7, file: "野菜類_ローズマリー.png" }
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
  { name: "しいたけ", quantity: 1, unit: "パック", default_deadline: 7, file: "きのこ類_しいたけ.png" },
  { name: "ぶなしめじ", quantity: 1, unit: "パック", default_deadline: 7, file: "きのこ類_ぶなしめじ.png" },
  { name: "えのき", quantity: 1, unit: "パック", default_deadline: 7, file: "きのこ類_えのきたけ.png" },
  { name: "エリンギ", quantity: 1, unit: "パック", default_deadline: 7, file: "きのこ類_エリンギ.png" },
  { name: "まいたけ", quantity: 1, unit: "パック", default_deadline: 7, file: "きのこ類_まいたけ.png" },
  { name: "なめこ", quantity: 1, unit: "袋", default_deadline: 7, file: "きのこ類_なめこ.png" },
  { name: "マッシュルーム", quantity: 1, unit: "パック", default_deadline: 7, file: "きのこ類_マッシュルーム.png" }
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

meats = [
  { name: "牛切り落とし", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛切り落とし.png" },
  { name: "牛ステーキ", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛ステーキ.png" },
  { name: "牛かた", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛かた.png" },
  { name: "牛肩ロース", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛かたロース.png" },
  { name: "牛バラ", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛バラ.png" },
  { name: "牛もも", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛もも.png" },
  { name: "牛タン", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_牛タン.png" },
  { name: "牛ひき肉", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_牛ひき肉.png" },
  { name: "牛豚合挽き肉", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_牛豚合い挽き肉.png" },
  { name: "豚こま切れ", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚こま切れ.png" },
  { name: "豚バラ薄切り", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚バラ薄切り.png" },
  { name: "豚ロース薄切り", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚ロース薄切り.png" },
  { name: "豚ロース厚切り", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚ロース厚切り.png" },
  { name: "豚もも", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚もも.png" },
  { name: "豚バラブロック", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚バラブロック.png" },
  { name: "豚肩ブロック", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚肩ブロック.png" },
  { name: "豚ヒレ", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_豚ヒレブロック.png" },
  { name: "豚ひき肉", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_豚ひき肉.png" },
  { name: "鶏もも", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏もも.png" },
  { name: "鶏むね", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏むね.png" },
  { name: "鶏ささみ", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏ささみ.png" },
  { name: "鶏手羽元", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏手羽元.png" },
  { name: "鶏手羽先", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏手羽先.png" },
  { name: "鶏手羽中", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏手羽中.png" },
  { name: "鶏ひき肉", quantity: 1, unit: "パック", default_deadline: 2, file: "肉類_鶏ひき肉.png" },
  { name: "砂肝", quantity: 1, unit: "パック", default_deadline: 3, file: "肉類_砂肝.png" },
  { name: "鶏レバー", quantity: 1, unit: "パック", default_deadline: 1, file: "肉類_鶏レバー.png" }
]

meat_category = Category.find_by(name: "肉")
meats.each do |data|
  meat = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  meat.assign_attributes(
    category_id: meat_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    meat.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if meat.save
    puts "✅ 登録成功: #{meat.name}"
  else
    puts "❌ 登録失敗: #{meat.name}"
    puts food.errors.full_messages
  end
end

seafoods = [
  { name: "サケ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_さけ.png" },
  { name: "サバ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_さば.png" },
  { name: "ぶり", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_ぶり.png" },
  { name: "タラ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_たら.png" },
  { name: "タイ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_たい.png" },
  { name: "カツオ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_かつお.png" },
  { name: "サワラ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_サワラ.png" },
  { name: "さんま", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_さんま.png" },
  { name: "いわし", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_いわし.png" },
  { name: "あじ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_あじ.png" },
  { name: "ウナギの蒲焼き", quantity: 1, unit: "パック", default_deadline: 3, file: "魚介類_うなぎの蒲焼.png" },
  { name: "ししゃも", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_ししゃも.png" },
  { name: "ほっけ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_ほっけ.png" },
  { name: "マグロ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_まぐろ.png" },
  { name: "サーモン", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_サーモン.png" },
  { name: "いくら", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_いくら.png" },
  { name: "かずのこ", quantity: 1, unit: "パック", default_deadline: 5, file: "魚介類_数の子.png" },
  { name: "たらこ", quantity: 1, unit: "パック", default_deadline: 7, file: "魚介類_たらこ.png" },
  { name: "辛子明太子", quantity: 1, unit: "パック", default_deadline: 7, file: "魚介類_辛子明太子.png" },
  { name: "しらす", quantity: 1, unit: "パック", default_deadline: 3, file: "魚介類_しらす.png" },
  { name: "ゆでたこ", quantity: 1, unit: "パック", default_deadline: 3, file: "魚介類_たこ.png" },
  { name: "いか", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_いか.png" },
  { name: "あまえび", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_あまえび.png" },
  { name: "えび", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_えび.png" },
  { name: "牡蠣", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_かき.png" },
  { name: "ホタテ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_ほたて.png" },
  { name: "かに", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_かに.png" },
  { name: "ウニ", quantity: 1, unit: "パック", default_deadline: 3, file: "魚介類_うに.png" },
  { name: "アワビ", quantity: 1, unit: "個", default_deadline: 3, file: "魚介類_あわび.png" },
  { name: "サザエ", quantity: 1, unit: "個", default_deadline: 3, file: "魚介類_さざえ.png" },
  { name: "ハマグリ", quantity: 1, unit: "個", default_deadline: 2, file: "魚介類_はまぐり.png" },
  { name: "しじみ", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_しじみ.png" },
  { name: "あさり", quantity: 1, unit: "パック", default_deadline: 2, file: "魚介類_あさり.png" },
  { name: "生わかめ", quantity: 1, unit: "パック", default_deadline: 2, file: "藻類_わかめ.png" },
  { name: "生昆布", quantity: 1, unit: "パック", default_deadline: 2, file: "藻類_こんぶ.png" },
  { name: "ひじき", quantity: 1, unit: "パック", default_deadline: 3, file: "藻類_ひじき.png" },
  { name: "もずく", quantity: 1, unit: "パック", default_deadline: 5, file: "藻類_もずく.png" }
]

seafood_category = Category.find_by(name: "魚介・海藻")
seafoods.each do |data|
  seafood = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  seafood.assign_attributes(
    category_id: seafood_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    seafood.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if seafood.save
    puts "✅ 登録成功: #{seafood.name}"
  else
    puts "❌ 登録失敗: #{seafood.name}"
    puts food.errors.full_messages
  end
end

egg_ane_dairies = [
  { name: "鶏卵", quantity: 1, unit: "パック", default_deadline: 14, file: "卵類_鶏卵.png" },
  { name: "うずら卵", quantity: 1, unit: "パック", default_deadline: 14, file: "卵類_うずら卵.png" },
  { name: "たまご豆腐", quantity: 1, unit: "パック", default_deadline: 7, file: "卵類_卵豆腐.png" },
  { name: "牛乳", quantity: 1, unit: "本", default_deadline: 10, file: "乳類_牛乳.png" },
  { name: "ヨーグルト", quantity: 1, unit: "パック", default_deadline: 10, file: "乳類_ヨーグルト.png" },
  { name: "生クリーム", quantity: 1, unit: "パック", default_deadline: 7, file: "乳類_生クリ-ム.png" },
  { name: "バター", quantity: 1, unit: "箱", default_deadline: 28, file: "乳類_バター.png" },
  { name: "無塩バター", quantity: 1, unit: "箱", default_deadline: 28, file: "乳類_無塩バター.png" },
  { name: "クリームチーズ", quantity: 1, unit: "箱", default_deadline: 28, file: "乳類_クリームチーズ.png" },
  { name: "モッツァレラチーズ", quantity: 1, unit: "袋", default_deadline: 7, file: "モッツァレラ.png" },
  { name: "カマンベールチーズ", quantity: 1, unit: "個", default_deadline: 28, file: "乳類_カマンベールチーズ.png" },
  { name: "プロセスチーズ", quantity: 1, unit: "袋", default_deadline: 28, file: "乳類_プロセスチーズ.png" },
  { name: "スライスチーズ", quantity: 1, unit: "袋", default_deadline: 28, file: "乳類_スライスチーズ.png" },
  { name: "ミックスチーズ", quantity: 1, unit: "袋", default_deadline: 14, file: "乳類_ミックスチーズ.png" }
]

egg_ane_dairy_category = Category.find_by(name: "卵・乳")
egg_ane_dairies.each do |data|
  egg_ane_dairy = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  egg_ane_dairy.assign_attributes(
    category_id: egg_ane_dairy_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    egg_ane_dairy.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if egg_ane_dairy.save
    puts "✅ 登録成功: #{egg_ane_dairy.name}"
  else
    puts "❌ 登録失敗: #{egg_ane_dairy.name}"
    puts food.errors.full_messages
  end
end

staple_foods = [
  { name: "ごはん", quantity: 1, unit: "杯", default_deadline: 2, file: "穀類_ごはん.png" },
  { name: "餅", quantity: 1, unit: "個", default_deadline: 14, file: "穀類_もち.png" },
  { name: "サンドイッチ", quantity: 1, unit: "個", default_deadline: 1, file: "穀類_サンドイッチ.png" },
  { name: "そば(生)", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_そば(生).png" },
  { name: "そば(ゆで)", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_そば(ゆで).png" },
  { name: "うどん(生)", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_うどん(生).png" },
  { name: "うどん(ゆで)", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_うどん(ゆで).png" },
  { name: "中華麺(生)", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_中華めん(生).png" },
  { name: "中華麺(ゆで)", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_中華めん(ゆで).png" },
  { name: "生パスタ", quantity: 1, unit: "人前", default_deadline: 5, file: "穀類_生パスタ.png" },
  { name: "パン粉", quantity: 1, unit: "袋", default_deadline: 28, file: "穀類_パン粉.png" },
  { name: "お麩", quantity: 1, unit: "袋", default_deadline: 28, file: "穀類_お麩.png" },
  { name: "木綿豆腐", quantity: 1, unit: "パック", default_deadline: 5, file: "豆類_木綿豆腐.png" },
  { name: "絹ごし豆腐", quantity: 1, unit: "パック", default_deadline: 5, file: "豆類_絹ごし豆腐.png" },
  { name: "焼き豆腐", quantity: 1, unit: "パック", default_deadline: 5, file: "豆類_焼き豆腐.png" },
  { name: "油揚げ", quantity: 1, unit: "袋", default_deadline: 5, file: "豆類_油揚げ.png" },
  { name: "厚揚げ", quantity: 1, unit: "袋", default_deadline: 3, file: "豆類_厚揚げ.png" },
  { name: "おから", quantity: 1, unit: "袋", default_deadline: 2, file: "豆類_おから.png" },
  { name: "納豆", quantity: 1, unit: "パック", default_deadline: 7, file: "豆類_納豆.png" },
  { name: "豆乳", quantity: 1, unit: "本", default_deadline: 28, file: "豆類_豆乳.png" }
]

staple_food_category = Category.find_by(name: "穀・豆")
staple_foods.each do |data|
  staple_food = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  staple_food.assign_attributes(
    category_id: staple_food_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    staple_food.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if staple_food.save
    puts "✅ 登録成功: #{staple_food.name}"
  else
    puts "❌ 登録失敗: #{staple_food.name}"
    puts food.errors.full_messages
  end
end

fruits = [
  { name: "バナナ", quantity: 1, unit: "房", default_deadline: 10, file: "果実類_バナナ.png" },
  { name: "いちご", quantity: 1, unit: "パック", default_deadline: 7, file: "果実類_イチゴ.png" },
  { name: "りんご", quantity: 1, unit: "個", default_deadline: 28, file: "果実類_りんご.png" },
  { name: "みかん", quantity: 1, unit: "個", default_deadline: 14, file: "果実類_みかん.png" },
  { name: "キウイ", quantity: 1, unit: "個", default_deadline: 14, file: "果実類_キウイ.png" },
  { name: "オレンジ", quantity: 1, unit: "個", default_deadline: 14, file: "果実類_オレンジ.png" },
  { name: "グレープフルーツ", quantity: 1, unit: "個", default_deadline: 14, file: "果実類_グレ-プフル-ツ.png" },
  { name: "レモン", quantity: 1, unit: "個", default_deadline: 21, file: "果実類_レモン.png" },
  { name: "柚子", quantity: 1, unit: "個", default_deadline: 10, file: "果実類_ゆず.png" },
  { name: "アボカド", quantity: 1, unit: "個", default_deadline: 7, file: "果実類_アボカド.png" },
  { name: "ブルーベリー", quantity: 1, unit: "パック", default_deadline: 7, file: "果実類_ブルーベリー.png" },
  { name: "パイナップル", quantity: 1, unit: "個", default_deadline: 7, file: "果実類_パイナップル.png" },
  { name: "ぶどう", quantity: 1, unit: "房", default_deadline: 7, file: "果実類_ぶどう.png" },
  { name: "マスカット", quantity: 1, unit: "房", default_deadline: 5, file: "果実類_マスカット.png" },
  { name: "メロン", quantity: 1, unit: "個", default_deadline: 7, file: "果実類_メロン.png" },
  { name: "柿", quantity: 1, unit: "個", default_deadline: 14, file: "果実類_柿.png" },
  { name: "梨", quantity: 1, unit: "個", default_deadline: 14, file: "果実類_なし.png" },
  { name: "マンゴー", quantity: 1, unit: "個", default_deadline: 5, file: "果実類_マンゴー.png" },
  { name: "スイカ", quantity: 1/4, unit: "カット", default_deadline: 3, file: "果実類_スイカ.png" },
  { name: "さくらんぼ", quantity: 1, unit: "パック", default_deadline: 3, file: "果実類_さくらんぼ.png" },
  { name: "桃", quantity: 1, unit: "個", default_deadline: 7, file: "果実類_もも.png" },
  { name: "イチジク", quantity: 1, unit: "個", default_deadline: 4, file: "果実類_イチジク.png" },
  { name: "プルーン", quantity: 1, unit: "袋", default_deadline: 14, file: "果実類_プルーン.png" }
]

fruits_category = Category.find_by(name: "果物")
fruits.each do |data|
  fruit = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  fruit.assign_attributes(
    category_id: fruits_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    fruit.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if fruit.save
    puts "✅ 登録成功: #{fruit.name}"
  else
    puts "❌ 登録失敗: #{fruit.name}"
    puts food.errors.full_messages
  end
end

processed_foods = [
  { name: "ソーセージ", quantity: 1, unit: "袋", default_deadline: 14, file: "肉類_ウインナー.png" },
  { name: "ベーコン", quantity: 1, unit: "パック", default_deadline: 10, file: "肉類_ベーコン.png" },
  { name: "ハム", quantity: 1, unit: "袋", default_deadline: 14, file: "肉類_ハム.png" },
  { name: "生ハム", quantity: 1, unit: "パック", default_deadline: 21, file: "肉類_生ハム.png" },
  { name: "ランチョンミート(開封済)", quantity: 1, unit: "個", default_deadline: 5, file: "肉類_ランチョンミート.png" },
  { name: "ちくわ", quantity: 1, unit: "袋", default_deadline: 7, file: "魚介類_ちくわ.png" },
  { name: "はんぺん", quantity: 1, unit: "袋", default_deadline: 7, file: "魚介類_はんぺん.png" },
  { name: "かまぼこ", quantity: 1, unit: "パック", default_deadline: 7, file: "魚介類_かまぼこ.png" },
  { name: "カニカマ", quantity: 1, unit: "パック", default_deadline: 7, file: "魚介類_かにかま.png" },
  { name: "さつま揚げ", quantity: 1, unit: "パック", default_deadline: 7, file: "魚介類_さつま揚げ.png" },
  { name: "こんにゃく", quantity: 1, unit: "袋", default_deadline: 28, file: "その他_こんにゃく.png" }
]

processed_food_category = Category.find_by(name: "加工品")
processed_foods.each do |data|
  processed_food = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  processed_food.assign_attributes(
    category_id: processed_food_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    processed_food.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if processed_food.save
    puts "✅ 登録成功: #{processed_food.name}"
  else
    puts "❌ 登録失敗: #{processed_food.name}"
    puts food.errors.full_messages
  end
end

others = [
  { name: "マーガリン", quantity: 1, unit: "箱", default_deadline: 28, file: "その他_マーガリン.png" }
]

other_category = Category.find_by(name: "その他")
others.each do |data|
  other = Food.find_or_initialize_by(name: data[:name], user_id: nil)
  other.assign_attributes(
    category_id: other_category.id,
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline]
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exist?(file_path)
    other.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end

  if other.save
    puts "✅ 登録成功: #{other.name}"
  else
    puts "❌ 登録失敗: #{other.name}"
    puts food.errors.full_messages
  end
end