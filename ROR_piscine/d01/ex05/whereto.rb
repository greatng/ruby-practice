# frozen_string_literal: true

# !/usr/bin/env ruby

def load_states
  {
    'Oregon' => 'OR',
    'Alabama' => 'AL',
    'New Jersey' => 'NJ',
    'Colorado' => 'CO'
  }
end

def load_capitals
  {
    'OR' => 'Salem',
    'AL' => 'Montgomery',
    'NJ' => 'Trenton',
    'CO' => 'Denver'
  }
end

def print_result(input, states, capitals_cities)
  if states.key?(input)
    puts "#{capitals_cities[states[input]]} is the capital of #{input} (akr: #{states[input]})"
  elsif capitals_cities.value?(input)
    states.each do |key, value|
      puts "#{input} is the capital of #{key} (akr: #{value})" if value == capitals_cities.key(input)
    end
  else
    puts "#{input} is neither a capital city nor a state"
  end
end

def main
  return if ARGV.length != 1

  inputs = ARGV[0].split(',').map(&:strip).map(&:capitalize)
  states = load_states
  capitals_cities = load_capitals
  inputs.each do |input|
    next if input.empty?

    print_result(input, states, capitals_cities)
  end
end

main
