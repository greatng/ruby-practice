# frozen_string_literal: true

# !/usr/bin/env ruby

def parsing_line
  file = File.open('periodic_table.txt', 'r')
  lines = []
  file.each_line do |line|
    arr = line.split('=').map(&:strip)
    tmp_hash = arr[1].split(',').map(&:strip).map { |x| x.split(':').map(&:strip) }.to_h
    arr[1] = tmp_hash
    lines.push(arr)
  end
  file.close
  lines
end

def print_box(write_file, line)
  write_file.puts("<td class='element'>
  <h5>#{line[0]}</h5><ul>
	<li>#{line[1]['number']}</li>
  <li class='short'>#{line[1]['small']}</li><li>#{line[1]['molar']}</li>
	<li class='electron'>#{line[1]['electron']}</li></ul></td>")
end

def add_style(write_file)
  write_file.puts(
    '<style>
		body {font-family: roboto, sans-serif;} table {border-collapse: collapse;}
		td {border: 0.1rem solid; padding:0.1rem; text-align: center; max-width: 5rem; min-width: 5rem;}
		h5 {margin:0; font-size: 0.75rem;} ul {list-style-type: none; padding-inline-start:0rem; margin:0px;}
		li {font-size:0.7rem;} .electron {font-size: 0.6rem;} .short {font-weight: bold; font-style: italic;}
		.element:nth-child(odd) {height: 5rem; background-color: #cdc6ff}
		</style>'
  )
end

def print_empty_box(write_file, number, line)
  while line[1]['position'].to_i != number
    number += 1
    write_file.puts('<td></td>')
  end
  number
end

def print_row(write_file, number, line)
  write_file.puts('<tr>') if number.zero?
  number = print_empty_box(write_file, number, line)
  print_box(write_file, line)
  write_file.puts('</tr>') if number == 17
  number += 1
  number = 0 if number == 18
  number
end

def print_table(write_file, lines)
  write_file.puts('<!DOCTYPE html>
		<html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=roboto"><title>Periodic Table</title></head>
		<body><table>')
  add_style(write_file)
  number = 0
  lines.each do |line|
    number = print_row(write_file, number, line)
  end
  write_file.puts('</table></body></html>')
end

def main
  lines = parsing_line
  write_file = File.new('periodic_table.html', 'w')
  print_table(write_file, lines)
  write_file.close
end

main
