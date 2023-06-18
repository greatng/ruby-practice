# frozen_string_literal: true

def shorter_way
  file = File.open('numbers.txt', 'r')

  numbers = file.read.split(",\n").map(&:to_i)
  file.close

  puts numbers.sort
end

def longer_way
  file = File.open('numbers.txt', 'r')
  number_array = []

  file.each_line do |line|
    cleaned_line = line.chop.chomp.to_i
    number_array.push(cleaned_line)
  end
  file.close

  puts number_array.sort
end

shorter_way
puts '-----------------'
longer_way
