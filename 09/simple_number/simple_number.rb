# == MyNumbers Module
# This module may store numbers in sumple form or roman form
#
module MyNumbers
  # == Pi
  # Determines value of PI (mathematic constant)
  #
  PI = 3.14

  # == The Answer
  # Answer to the world and everything
  #
  THE_ANSWER = 42

  # == SimpleNumber class
  # This class converts numbers from numeric format to roman format
  #
  # * *Usage* :
  #   - s = SimpleNumber.new(10) to create instance, s.multiply(value) to perform operations like multiply
  class SimpleNumber
    # == Attribute accesor
    # Attribute accesor
    #
    attr_accessor :value

    # == Initialize
    # Initializes current instance
    #
    # * *Args*    :
    #   - +num+ -> sets the default value of this number
    # * *Fails* :
    #   - Fails if value is not numberic
    #
    def initialize(num)
      fail unless num.is_a?(Numeric)
      @x = num
    end

    # == Add value
    # Adds value to current number
    #
    # * *Args*    :
    #   - +y+ -> value to be added
    # * *Returns* :
    #   - value of the current instance with the value added
    #
    def add(y)
      @x + y
    end

    # == Multiplies value
    # Multiplies the current number
    #
    # * *Args*    :
    #   - +y+ -> value to be multiplied with
    # * *Returns* :
    #   - value of the current instance multiplied by +y+
    #
    def multiply(y)
      @x * y
    end
  end

  # == Example
  # Lorem _ipsum_ dolor *sit amet*, consectetur adipisicing elit, sed
  # do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  # Ut enim ad minim veniam, quis nostrud exercitation ullamco
  # laboris nisi ut aliquip ex ea commodo consequat.
  #
  # * *Args*    :
  #   - +apples+ -> the number of apples
  #   - +oranges+ -> the number of oranges
  #   - +pears+ -> the number of pears
  # * *Returns* :
  #   - the total number of fruit as an integer
  # * *Raises* :
  #   - +ArgumentError+ -> if any value is nil or negative
  #
  def sum_fruit(apples, oranges, pears)
    fail ArgumentError, 'No value can be absent' if apples.nil? || oranges.nil? || pears.nil?
    fail ArgumentError, 'All values must be positive' unless apples >= 0 && oranges >= 0 && pears >= 0

    apples + oranges + pears
  end

  # == Roman module
  # This module converts numbers from numeric format to roman format
  #
  module Roman
    # == Roman class
    # This class converts numbers from numeric format to roman format
    #
    # * *Usage* :
    #   - r = Roman.new(10) to create instance, r.to_s to print instance in roman format
    class Roman
      include Comparable

      # == Max Roman
      # Determines the maximum value of the Roman number
      #
      MAX_ROMAN = 4999

      # == Factors
      # Determines the symbols for converting simple number to roman number
      #
      FACTORS = [['m', 1000], ['cm', 900], ['d', 500], ['cd', 400],
                 ['c', 100], ['xc', 90], ['l', 50], ['xl', 40],
                 ['x', 10], ['ix', 9], ['v', 5], ['iv', 4],
                 ['i', 1]]
      # == Attribute reader
      # Attribute reader
      #
      attr_reader :value
    end
  end
end
