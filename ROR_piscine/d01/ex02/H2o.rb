# frozen_string_literal: true

# !/usr/bin/env ruby

def parsing(data)
  hash = {}
  data.each do |elem|
    hash[elem[1]] = elem[0]
  end

  hash
end

def load_data
  [['Caleb', 24], ['Calixte', 84], ['Calliste', 65], ['Calvin', 12], ['Cameron', 54],
   ['Camil', 32], ['Camille', 5], ['Can', 52], ['Caner', 56], ['Cantin', 4], ['Carl', 1],
   ['Carlito', 23], ['Carlo', 19], ['Carlos', 26], ['Carter', 54], ['Casey', 2]]
end

def main
  data = load_data

  hash = parsing(data)

  hash.each do |key, value|
    puts "#{key} : #{value}"
  end
end

main
