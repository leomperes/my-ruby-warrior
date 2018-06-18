# Assignment 1:
# Write a program, in any language you choose, that prints the numbers from 1
# to 100. But for multiples of three print "Fizz" instead of the number and for
# the multiples of five print "Buzz". For numbers that are multiples of both
# three and five print "FizzBuzz".

# 100.times { |n| p n+1 ... }
(1..100).each do |number|

  puts case
       when (number % 3).zero? && (number % 5).zero?
         'FizzBuzz'
       when (number % 3).zero?
         'Fizz'
       when (number % 5).zero?
         'Buzz'
       else
         number
       end

end
