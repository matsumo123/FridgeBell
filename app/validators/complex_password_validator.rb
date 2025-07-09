class ComplexPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    unless value =~ /[0-9]/ && value =~ /[A-Z]/ && value =~ /[a-z]/
      record.errors.add(attribute, :complexity, message: "パスワードには、大文字・小文字・数字をそれぞれ1つ以上含めてください。")
    end
  end
end