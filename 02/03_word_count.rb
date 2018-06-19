#!/usr/bin/env ruby

# Count number of words in a given files
# (regardless font case)
def word_count(filetoOpen)
  count = {}
  file = File.open(filetoOpen, 'r')

  file.each_line do |line|
    words = line.split
    words.each do |word|
      word = word.gsub(/[,()'"?.]/, '')
      word = word.downcase
      if count.key?(word)
        count[word] += 1
      else
        count[word] = 1
      end
    end
  end
  count = count.each_with_object({}) { |(k, v), memo| memo[k.to_sym] = v; memo }
  count
end
