module ApplicationHelper
  def default_meta_tags
    {
      site: "FridgeBell",
      title: "FridgeBell | 冷蔵庫の食材を管理するサービス",
      reverse: true,
      charset: "utf-8",
      description: "FridgeBellは冷蔵庫の食材を登録し、期限が近づくとLINEでお知らせを受け取ることができます。",
      keywords: "冷蔵庫, 食材管理, 賞味期限, 消費期限, 通知, LINE",
      canonical: "https://fridgebell.fly.dev/",
      separator: "|",
      icon: [
        { href: image_url("favicon.ico") },
        { href: "apple-touch-icon.png", rel: "apple-touch-icon", sizes: "180x180", type: "image/png" }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://fridgebell.fly.dev/",
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        image: image_url("x_ogp.png")
      }
    }
  end

  def bg_color(remaining_days)
    case remaining_days
    when ...0
      "before:bg-gray-400"
    when 0..2
      "before:bg-red-400"
    when 3..5
      "before:bg-yellow-400"
    else
      "before:bg-green-400"
    end
  end

  def emoji(remaining_days)
    case remaining_days
    when ...0
      "😵‍💫"
    when 0
      "😰"
    when 1..2
      "😟"
    when 3..5
      "😬"
    else
      "☺️"
    end
  end

  def page_title(title = "")
    base_title = "FridgeBell"
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
