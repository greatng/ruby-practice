# frozen_string_literal: true

# The `class Hangman` is defining a class called `Hangman`. This class represents a game of Hangman.
class Hangman
  attr_reader :word, :live

  def initialize(word)
    @word_array = word.split(' ')
    @live = 6
  end

  def start
    @word = @word_array.sample
    @current = ['_'] * @word.length
    puts 'Welcome to Hangman!'
    puts "You have #{live} lives to guess the word."
    guess
  end

  def guess
    while live.positive? && @current.include?('_')
      guess = gets.chomp.downcase
      if word.include?(guess)
        correct_guess(guess)
      else
        wrong_guess(guess)
      end
    end
  end

  def correct_guess(guess)
    puts 'You guessed correctly!'
    word.each_char.with_index do |letter, index|
      @current[index] = guess if letter == guess
    end
    puts @current.join(' ')
    win
  end

  def wrong_guess(_guess)
    puts 'You guessed wrong!'
    @live -= 1
    puts "You have #{live} lives left."
    lose
  end

  def win
    return unless word == @current.join('')

    puts 'You win!'
    puts "The word was '#{word}'."
  end

  def lose
    return unless live.zero?

    puts 'You lose!'
    puts "The word was '#{word}'."
  end
end

game = Hangman.new('hello world of ruby')

game.start
