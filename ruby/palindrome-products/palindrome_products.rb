require 'prime'

class Palindromes
  attr_reader :largest, :min_factor, :max_factor, :smallest

  def initialize(min_factor: 1, max_factor:)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    @largest = Palindrome.new(palindrome(largest: true), multipliers)
    @smallest = Palindrome.new(palindrome, multipliers)
  end

  def multipliers
    @multipliers ||= (@min_factor..@max_factor).to_a
  end

  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end

  def palindrome(largest: false)
    nums = largest ? multipliers.reverse : multipliers
    offset = max_factor/10
    pal = nil
    mult2 = nums.detect do |n|
      start = nums.index(n) - offset
      start = 0 if start < 0
      en = start + offset
      m = nums[start..en].detect{|m| palindrome?(n * m) }
      m && pal = m * n
    end
    pal
  end
end

class Palindrome
  attr_reader :value, :multipliers

  def initialize(value, multipliers)
    @value = value
    @multipliers = multipliers
  end

  def factors
    (1..(Math.sqrt(@value).round)).to_a.inject([]) do |accum, n|
      if @value % n == 0 && ([n, @value/n].all?{|n| multipliers.include?(n)})
        accum << [n, @value/n]
      end
      accum
    end
  end
end
