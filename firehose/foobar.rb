puts "How many items of the Foobar pattern do you want to see?"

user_input = gets.chomp.to_i

number = 1

while number <= user_input
  if number % 3 == 0 && number % 5 == 0
    puts "Foobar"
  elsif number % 3 == 0
    puts "Foo"
  elsif number % 5 == 0
    puts "Bar"
  else
    puts number
  end
  number += 1
end