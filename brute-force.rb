require "pry-byebug"

class TriangleNumberDivisors

  def initialize(divisor_count)
    @nums = [1]
    @divisor_count = divisor_count
  end

  def triangle_number
    @nums.inject(:+)
  end

  def get_divisors
    x = triangle_number
    (2..(x/2)).collect do |n|
      [n, x/n] if (n * (x/n) == x)
    end.unshift([1, x]).flatten.uniq

    # (1..x).select {|n| x % n == 0}
  end

  def enough_divisors
    while get_divisors.count <= @divisor_count
      # binding.pry
      @nums << @nums.last + 1
    end
    triangle_number
  end
end


puts "pick a number of divisors"
str = gets.chomp 
ans = TriangleNumberDivisors.new(str.to_i).enough_divisors
puts ans