#!/usr/bin/env ruby

# Create a procedure to uppercase only
# Strings beginning with letter 'a' or 'A'.
# Proc returns original object if not String.
def bring_up
  proc do |x|
    x = x.upcase if (x.class == String) && ((x[0] == 'a') || (x[0] == 'A'))
    x
  end
end

# Create a procedure to multiple only
# values representing an Integer by two.
# Proc returns a string representation.
# Proc returns original string if not Integer-like.
def make_double
  proc do |x|
    newstring = ''
    if x.class == String
      x.split('').each do |y|
        begin
          a = Integer(y)
          a *= 2
        rescue Exception
          a = -1
        end
        newstring << if a >= 0
                       String(a)
                     else
                       y
                     end
      end
      if newstring != x
        newstring
      else
        x
      end
    else
      if x.class == Fixnum
        x *= 2
        x = String(x)
      end
      x
    end
  end
end

# Create a function to multiply all
# numbers in text by two.
# (Hint: use the previously defined procedure)
# Set of whitespaces should be changed to one space.
# (Hint: split and join is ok)

def increase_wage(contract)
  make_double.call(contract).split(' ').join(' ')
end

# Run both of the created procedures
# and collect resulting array.

def process_text_array(array)
  newarray = []
  array.each do |x|
    newarray.push(make_double.call(bring_up.call(x)))
  end
  newarray
end
