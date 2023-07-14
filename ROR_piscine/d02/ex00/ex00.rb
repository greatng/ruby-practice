# frozen_string_literal: true

# !/usr/bin/env ruby

# The `Html` class is a Ruby class that helps create and write HTML files by providing methods for
# creating the head section, dumping content, and finishing the file.
class Html
  attr_reader :page_name
  attr_accessor :file

  def initialize(name)
    @page_name = name
    @file = File.new("#{name}.html", 'w')
    head
  end

  def head
    file.puts("<!DOCTYPE html>\n<html>\n<head>\n<title>#{page_name}</title>\n</head>\n<body>")
  end

  def dump(str)
    file.puts("<p>#{str}<p>")
  end

  def finish
    file.puts("</body>\n</html>")
    file.close
  end
end

if __FILE__ == $PROGRAM_NAME
  html = Html.new('test')
  10.times { |i| html.dump("This is line #{i}") }
  html.finish
end
