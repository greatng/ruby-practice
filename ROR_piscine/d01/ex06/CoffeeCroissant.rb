# frozen_string_literal: true

def load_data
  [['Frank', 33], ['Stacy', 15], ['Juan', 24], ['Dom', 32], ['Steve', 24], ['Jill', 24]]
end

def main
  data = load_data
  data.sort_by! { |elem| [elem[1], elem[0]] }
  data.each { |elem| puts elem[0] }
end

main
