require_relative 'tovar'
require_relative 'book'
require_relative 'movie'
require_relative 'hui'

collect1 = Get_collection.read_xml
puts "We have:\n\n"
num = 1
collect1.each do |item|
  puts num.to_s + '. ' + item.to_s
  num += 1
end

puts "\nWhat would You like to buy?"
ans = STDIN.gets.chomp
list = ans.split ''
list.map! {|x| x.to_i}
total_price = 0
puts "\nYour order is: "
list.each do |y|
  puts "#{collect1[y-1].class.to_s.capitalize} \"#{collect1[y-1].name.strip}\""
  total_price += collect1[y-1].price.to_i
end

puts "Total price of Your order is #{total_price.to_s}$"

