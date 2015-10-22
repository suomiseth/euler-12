class TriangleNumberDivisors

  def initialize(limit)
    @limit = limit
  end

  def divisor_count(num)
    (1..Math.sqrt(num)).collect do |n| 
      [n, num/n] if ((num/n) * n) == num
    end.compact.flatten.count
  end

  def find_it
    tri_numbers = [1]
    while divisor_count(tri_numbers.last) <= @limit
      tri_numbers << tri_numbers.last + tri_numbers.size + 1
    end
    tri_numbers.last
  end
end


puts "pick a number of divisors"
str = gets.chomp 
ans = TriangleNumberDivisors.new(str.to_i).find_it
puts ans