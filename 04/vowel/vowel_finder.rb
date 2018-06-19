#!/usr/bin/env ruby

module Summable
  def sum
    reduce :+
  end
end

class Array
  include Summable
end

class VowelFinder < Array
  def initialize(string)
    vowels = %w(a e i o u y)
    stringChars = string.downcase.chars
    finalStringChars = []

    stringChars.each do |char|
      vowels.each do |vowel|
        finalStringChars.push(vowel) if char == vowel
      end
    end

    super(finalStringChars)
  end
end
