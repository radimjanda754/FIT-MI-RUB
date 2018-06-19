#!/usr/bin/env ruby

# Immitates some behaviour of the Array class
#
# see: http://www.ruby-doc.org/core/Array.html
class MyArray
  @ary

  def initialize(ary = [])
    @ary = ary
  end

  # Simple methods I can use here
  def [](i)
    @ary[i]
  end

  def size
    @ary.size
  end

  def first
    @ary.first
  end

  def drop(n)
    @ary.drop(n)
  end

  # Implemented methods
  def pop
    newary = []
    defaultcount = size
    count = 0
    each do |x| 
      count += 1
     newary.push(x) if count < size 
    end
    @ary = newary
    defaultcount
  end

  def to_a
    newary = []
    each { |x| newary.push(x) }
    newary
  end

  def each
    return to_enum(__method__) unless block_given?
    ary = @ary
    while !ary.nil? && !ary.empty?
      yield ary.first
      ary = ary.drop(1)
    end
  end

  def reverse_each
    return to_enum(__method__) unless block_given?
    ary = @ary
    while !ary.nil? && !ary.empty?
      yield ary.last
      ary.pop
    end
  end

  def reverse
    newary = []
    ary = @ary
    while !ary.nil? && !ary.empty?
      newary.push(ary.last)
      ary.pop
    end
    newary
  end

  def reverse!
    newary = []
    ary = @ary
    while !ary.nil? && !ary.empty?
      newary.push(ary.last)
      ary.pop
    end
    @ary = newary
  end

  def select
    return to_enum(__method__) unless block_given?
    newary = []
    ary = @ary
    while !ary.nil? && !ary.empty?
      newary.push(ary.first) if yield(ary.first)
      ary = ary.drop(1)
    end
    newary
  end

  def map
    return to_enum(__method__) unless block_given?
    newary = []
    ary = @ary
    while !ary.nil? && !ary.empty?
      new = yield ary.first
      newary.push(new)
      ary = ary.drop(1)
    end
    newary
  end

  def clear
    @ary = []
  end

  def include?(elem)
    each do |x|
      return true if x == elem
    end
    false
  end

  def max
    ary = @ary
    max = @ary.first.is_a?(String) ? @ary.first.length : @ary.first
    maxelem = @ary.first
    while !ary.nil? && !ary.empty?
      ary = ary.drop(1)
      next unless ary.first != nil
      arylen = ary.first.is_a?(String) ? ary.first.length : ary.first
      if arylen > max
        max = arylen
        maxelem = ary.first
      end
    end
    maxelem
  end
end
