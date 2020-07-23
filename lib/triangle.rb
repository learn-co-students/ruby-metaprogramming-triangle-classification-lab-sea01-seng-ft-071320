require 'pry'

class Triangle
  attr_reader :one, :two, :three

  def initialize(one, two, three)
    if (one <= 0 || two <= 0 || three <= 0) || ((one >= (two + three)) || (two >= (one + three)) || (three >= (one + two)))
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    end

    @one, @two, @three = one, two, three
  end

  def kind
    if is_equilateral?
      :equilateral
    elsif is_isosceles?
      :isosceles
    elsif is_scalene?
      :scalene
    end
  end

  def num_equal_sides
    4 - [ one, two, three ].uniq.length
  end

  def is_equilateral?
    num_equal_sides == 3
  end

  def is_isosceles?
    num_equal_sides == 2
  end

  def is_scalene?
    num_equal_sides == 1
  end

  class TriangleError < StandardError
    def message
      puts 'This is not a valid triangle!'
    end
  end
end

# binding.pry
