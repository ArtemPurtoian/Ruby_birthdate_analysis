# ask user for the year, month and date of their birth
# determine day of the week as text ("Thursday")
# determine day of the year as a number
# determine week of the year as a number
# determine if it was a leap year or not
require 'date'

# user inputs
puts "What year were you born?"
answer_year = gets.chomp.to_i

puts "What month were you born?"
answer_month = gets.chomp.to_i

puts "What day of the month were you born?"
answer_day = gets.chomp.to_i

# making a full date from the user inputs
full_birthdate = Date.new(answer_year,answer_month,answer_day)

week_day = full_birthdate.wday

# weekdays hash object
weekdays = {
  0 => 'Sunday',
  1 => 'Monday',
  2 => 'Tuesday',
  3 => 'Wednesday',
  4 => 'Thursday',
  5 => 'Friday',
  6 => 'Saturday'
}

weekday_name = nil

# iterating through the weekdays to get a weekday name
weekdays.each do |key, value|
  if week_day == key
    weekday_name = value
  end
end

# function that makes an ordinal number
def ordinalize(number)
  num_string = number.to_s
  last_two_digits = num_string[-2,2]
  last_digit = num_string[-1,1]
  case
  when ['11', '12', '13'].include?(last_two_digits)
    ending = 'th'
  when last_digit == '1'
    ending = 'st'
  when last_digit == '2'
    ending = 'nd'
  when last_digit == '3'
    ending = 'rd'
  else
    ending = 'th'
  end
  num_string + ending
end

# result output
puts "*********************************************"
puts "You were born on a #{weekday_name}."
puts "It was the #{ordinalize(full_birthdate.cweek)} week of the year."
puts "It was the #{ordinalize(full_birthdate.yday)} day of the year."

leap_year = full_birthdate.leap?

puts leap_year ? "You were born in a leap year." : "You were not born in a leap year."
puts "*********************************************"