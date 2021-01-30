puts "Enter a whole number greater than zero:"

number = gets.chomp.to_i
last_two_digits = number % 100
last_digit = number % 10

if 0 < number
  if last_two_digits > 10 && last_two_digits < 14
    suffix = "th"
  elsif last_digit == 1
    suffix = "st"
  elsif last_digit == 2
    suffix = "nd"
  elsif last_digit == 3
    suffix = "rd"
  else
    suffix = "th"
  end
  puts "That's the #{number}#{suffix} number!"
else
  puts "That's not a whole number greater than zero!"
end
