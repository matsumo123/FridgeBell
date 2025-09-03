module ApplicationHelper
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
end
