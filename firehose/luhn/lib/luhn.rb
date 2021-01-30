module Luhn
  def self.is_valid?(number)
    number_array = number.to_s.reverse.split("")

    sum_array = number_array.map.with_index do |digit_string, digit_index|
      digit_int = digit_string.to_i
      digit_int *= 2 if digit_index.odd?
      digit_int -= 9 if digit_int >= 10
      digit_int
    end

    (sum_array.sum % 10).zero?
  end
end
