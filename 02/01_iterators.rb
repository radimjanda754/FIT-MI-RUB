#!/usr/bin/env ruby

# Return array of odd elements from `array`
# in case that that a block is given, yield
# elements on odd index
# e.g.: [1,2,3,4,5,6] -> [2,4,6]
def odd_elements(array)
  counter = 0
  newarray = []
  array.each do |x|
    if counter.odd?
      if block_given?
        newarray.push(yield x)
      else
        newarray.push(x)
      end
    end
    counter += 1
  end
  newarray
end
