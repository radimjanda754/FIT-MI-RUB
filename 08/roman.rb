#!/usr/bin/env ruby
class Roman
  include Comparable

  CHARS = [['m', 1000], ['cm', 900], ['d', 500], ['cd', 400],
           ['c', 100], ['xc', 90], ['l', 50], ['xl', 40],
           ['x', 10], ['ix', 9], ['v', 5], ['iv', 4],
           ['i', 1]].freeze

  def roman_recursive(number)
    return '' if number < 1
    CHARS.each do |char|
      return char.first + roman_recursive(number - char.last) if number >= char.last
    end
  end

  def initialize(value)
    @value = value
    @roman = roman_recursive(@value)
  end

  def ==(other)
    other.to_f == to_f
  end

  def +(other)
    Roman.new(@value + other.to_i)
  end

  def -(other)
    Roman.new(@value - other.to_i)
  end

  def *(other)
    Roman.new(@value * other.to_i)
  end

  def /(other)
    Roman.new(@value / other.to_i)
  end

  def <=>(other)
    to_i <=> other.to_i
  end

  def coerce(other)
    [Roman.new(other.to_i), self]
  end

  def eql?(other)
    (other == self) && other.is_a?(Roman)
    other == self && (other.is_a? Roman)
  end

  def respond_to?(_method_name)
    true
  end

  def to_i
    @value
  end

  def to_int
    to_i
  end

  def to_s
    @roman
  end

  def to_f
    @value.to_f
  end
end
