# frozen_string_literal: true

def my_var
  a = 10
  b = '10'
  c = nil
  d = 10.0

  puts "a contains #{a} and is a Type: #{a.class}"
  puts "b contains #{b} and is a Type: #{b.class}"
  puts "c contains #{c} and is a Type: #{c.class}"
  puts "d contains #{d} and is a Type: #{d.class}"
end

my_var
