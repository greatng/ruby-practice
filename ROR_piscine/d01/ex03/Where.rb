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

def main
  return if ARGV.length != 1

  states = load_states

  capitals_cities = load_capitals

  if states.key?(ARGV[0])
    puts capitals_cities[states[ARGV[0]]]
  else
    puts 'Unknown state'
  end
end

main
