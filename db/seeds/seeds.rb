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
  { category_id: 1, name: "トマト", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_トマト.png" },
  { category_id: 1, name: "ミニトマト", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_ミニトマト.png" },
  { category_id: 1, name: "きゅうり", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_きゅうり.png" },
  { category_id: 1, name: "なす", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_なす.png" },
  { category_id: 1, name: "ピーマン", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ピーマン.png" },
  { category_id: 1, name: "パプリカ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_パプリカ.png" },
  { category_id: 1, name: "しし唐", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ししとう.png" },
  { category_id: 1, name: "かぼちゃ", quantity: "1/4", unit: "個", default_deadline: 5, file: "野菜類_かぼちゃ.png" },
  { category_id: 1, name: "ゴーヤ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ゴーヤ.png" },
  { category_id: 1, name: "オクラ", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_オクラ.png" },
  { category_id: 1, name: "いんげん", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_いんげん.png" },
  { category_id: 1, name: "ズッキーニ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ズッキーニ.png" },
  { category_id: 1, name: "絹さや", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_さやえんどう.png" },
  { category_id: 1, name: "スナップエンドウ", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_スナップえんどう.png" },
  { category_id: 1, name: "そら豆", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_そら豆.png" },
  { category_id: 1, name: "グリンピース", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_グリンピース.png" },
  { category_id: 1, name: "キャベツ", quantity: "1/4", unit: "個", default_deadline: 5, file: "野菜類_キャベツ.png" },
  { category_id: 1, name: "白菜", quantity: "1/4", unit: "個", default_deadline: 5, file: "野菜類_はくさい.png" },
  { category_id: 1, name: "ほうれん草", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_ほうれんそう.png" },
  { category_id: 1, name: "小松菜", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_小松菜.png" },
  { category_id: 1, name: "チンゲン菜", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_チンゲンサイ.png" },
  { category_id: 1, name: "春菊", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_しゅんぎく.png" },
  { category_id: 1, name: "ニラ", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_ニラ.png" },
  { category_id: 1, name: "水菜", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_みずな.png" },
  { category_id: 1, name: "三つ葉", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_みつば.png" },
  { category_id: 1, name: "セロリ", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_セロリ.png" },
  { category_id: 1, name: "レタス", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_レタス.png" },
  { category_id: 1, name: "サニーレタス", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_サニーレタス.png" },
  { category_id: 1, name: "クレソン", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_クレソン.png" },
  { category_id: 1, name: "ブロッコリー", quantity: "1", unit: "株", default_deadline: 5, file: "野菜類_ブロッコリー.png" },
  { category_id: 1, name: "カリフラワー", quantity: "1", unit: "株", default_deadline: 5, file: "野菜類_カリフラワー.png" },
  { category_id: 1, name: "アスパラガス", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_アスパラガス.png" },
  { category_id: 1, name: "玉ねぎ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_タマネギ.png" },
  { category_id: 1, name: "長ネギ", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_長ねぎ.png" },
  { category_id: 1, name: "葉ネギ", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_葉ねぎ.png" },
  { category_id: 1, name: "もやし", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_もやし.png" },
  { category_id: 1, name: "豆苗", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_豆苗.png" },
  { category_id: 1, name: "かいわれ大根", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_かいわれだいこん.png" },
  { category_id: 1, name: "たけのこ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_たけのこ.png" },
  { category_id: 1, name: "せり", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_せり.png" },
  { category_id: 1, name: "空心菜", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_くうしんさい.png" },
  { category_id: 1, name: "モロヘイヤ", quantity: "1", unit: "袋", default_deadline: 5, file: "野菜類_モロヘイヤ.png" },
  { category_id: 1, name: "大根", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_だいこん.png" },
  { category_id: 1, name: "かぶ", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_かぶ.png" },
  { category_id: 1, name: "にんじん", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_ニンジン.png" },
  { category_id: 1, name: "じゃがいも", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ジャガイモ.png" },
  { category_id: 1, name: "さつまいも", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_さつまいも.png" },
  { category_id: 1, name: "長いも", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_ながいも.png" },
  { category_id: 1, name: "里芋", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_さといも.png" },
  { category_id: 1, name: "ごぼう", quantity: "1", unit: "本", default_deadline: 5, file: "野菜類_ごぼう.png" },
  { category_id: 1, name: "レンコン", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_れんこん.png" },
  { category_id: 1, name: "しそ", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_しそ.png" },
  { category_id: 1, name: "みょうが", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_みょうが.png" },
  { category_id: 1, name: "にんにく", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_ニンニク.png" },
  { category_id: 1, name: "しょうが", quantity: "1", unit: "個", default_deadline: 5, file: "野菜類_しょうが.png" },
  { category_id: 1, name: "パセリ", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_パセリ.png" },
  { category_id: 1, name: "パクチー", quantity: "1", unit: "束", default_deadline: 5, file: "野菜類_パクチー.png" },
  { category_id: 1, name: "バジル", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_バジル.png" },
  { category_id: 1, name: "ローズマリー", quantity: "1", unit: "パック", default_deadline: 5, file: "野菜類_ローズマリー.png" }
]

vegetables.each do |data|
  vegetable = Food.find_or_create_by(
    category_id: data[:category_id],
    name: data[:name],
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline],
    user_id: nil
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exists?(file_path)
    vegetable.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end
end

mushrooms = [
  { category_id: 2, name: "しいたけ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_しいたけ.png" },
  { category_id: 2, name: "ぶなしめじ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_ぶなしめじ.png" },
  { category_id: 2, name: "えのき", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_えのきたけ.png" },
  { category_id: 2, name: "エリンギ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_エリンギ.png" },
  { category_id: 2, name: "まいたけ", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_まいたけ.png" },
  { category_id: 2, name: "なめこ", quantity: "1", unit: "袋", default_deadline: 5, file: "きのこ類_なめこ.png" },
  { category_id: 2, name: "マッシュルーム", quantity: "1", unit: "パック", default_deadline: 5, file: "きのこ類_マッシュルーム.png" }
]

mushrooms.each do |data|
  mushroom = Food.find_or_create_by(
    category_id: data[:category_id],
    name: data[:name],
    quantity: data[:quantity],
    unit: data[:unit],
    default_deadline: data[:default_deadline],
    user_id: nil
  )
  file_path = Rails.root.join("db/seeds/images", data[:file])
  if File.exists?(file_path)
    mushroom.food_image.attach(
    io: File.open(file_path),
    filename: data[:file]
    )
  else
    puts "画像ファイルが見つかりません: #{file_path}"
  end
end

meats = [
  { category_id: 3, name: "牛切り落とし", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛ステーキ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛ブロック", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛かた", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛肩ロース", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛バラ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛もも", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛タン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛ひき肉", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "牛豚合挽き肉", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚こま切れ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚バラ薄切り", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚ロース薄切り", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚ロース厚切り", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚もも", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚バラブロック", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚肩ロースブロック", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "豚ひき肉", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏もも", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏むね", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏ささみ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏手羽元", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏手羽先", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏ひき肉", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "砂肝", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "鶏レバー", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "ソーセージ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "ベーコン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "ハム", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "生ハム", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 3, name: "スパム", quantity: "1", unit: "個", default_deadline: 5, food_image: "" }
]

seafoods = [
  { category_id: 4, name: "サケ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "サバ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ぶり", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "タラ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "タイ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "カツオ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "サワラ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "さんま", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "いわし", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "あじ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ウナギ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ししゃも", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ほっけ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "マグロ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "サーモン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "いくら", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "かずのこ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "たらこ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "辛子明太子", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "しらす", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "たこ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "いか", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "えび", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "牡蠣", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ホタテ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "かに", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ウニ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "アワビ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "サザエ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ハマグリ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "あさり", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ちくわ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "はんぺん", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "カニカマ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "さつま揚げ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "わかめ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "昆布", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "ひじき", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "もずく", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "海ぶどう", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 4, name: "のり", quantity: "1", unit: "個", default_deadline: 5, food_image: "" }
]

egg_ane_dairies = [
  { category_id: 5, name: "鶏卵", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "うずら卵", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "牛乳", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "ヨーグルト", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "生クリーム", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "バター", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "クリームチーズ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "モッツァレラチーズ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "カマンベールチーズ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "プロセスチーズ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "スライスチーズ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 5, name: "ピザ用チーズ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" }
]

staple_foods = [
  { category_id: 6, name: "米", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "餅", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "食パン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "フランスパン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "クロワッサン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "菓子パン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "惣菜パン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "そうめん", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "そば", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "うどん", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "パスタ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "中華麺", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "マカロニ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "パン粉", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "豆腐", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "油揚げ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "厚揚げ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "おから", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "納豆", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 6, name: "豆乳", quantity: "1", unit: "個", default_deadline: 5, food_image: "" }
]

fruits = [
  { category_id: 7, name: "バナナ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "いちご", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "りんご", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "みかん", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "キウイ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "オレンジ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "グレープフルーツ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "レモン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "柚子", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "アボカド", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "ブルーベリー", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "パイナップル", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "ぶどう", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "メロン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "柿", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "梨", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "マンゴー", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "スイカ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "さくらんぼ", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "桃", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "イチジク", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "プルーン", quantity: "1", unit: "個", default_deadline: 5, food_image: "" },
  { category_id: 7, name: "栗", quantity: "1", unit: "個", default_deadline: 5, food_image: "" }
]
