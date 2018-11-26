class Acronym
  def self.abbreviate(phrase)
    abbreviator(Accumulator.new(phrase))
  end

  def self.abbreviator(accum)
    char = accum.remainder[0]
    remainder = accum.remainder[1..-1]
    string = accum.string
    return accum.string if !char
    if self.acronymable?(accum.last_char, char)
      string += char.upcase
    end
    abbreviator(Accumulator.new(remainder, string, char))
  end

  def self.acronymable?(last_char, char)
    !last_char || (last_char.match(/\W/) && char.match(/\w/))
  end
end

class Accumulator
   attr_reader :string, :last_char, :remainder
  def initialize(remainder, string="", last_char=nil)
    @last_char = last_char
    @remainder = remainder
    @string = string
  end
end
