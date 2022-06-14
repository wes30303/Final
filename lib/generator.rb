require "pry"
require 'date'
require './lib/rotate'
class Generator
  include Rotate
  attr_reader :a_z, :random, :date, :message, :reverse_a, :reverse_b, :reverse_c, :reverse_d

  def initialize(message, random = (0..5).map {rand(0...9)}.join.to_i, date = (Time.new).strftime("%d%m%y").to_i)
    @message = message
    @a_z = ("a".."z").to_a << " "
    @random = random
    @date = date
  end

  def random_num
    @random = (0..5).map {rand(0...9)}.join.to_i
  end

  def date_squared
    info = ((@date.to_i) ** 2).to_s[-4..-1].to_i
  end

  def keys
    split_number = @random.to_s.split("")
    keys = []
    index = 0
    split_number.each do |key|
      keys << (key + split_number[index + 1]).to_i
      index += 1
      break if keys.length == 4
    end
    keys
  end

  def shifts
    shifts = []
    index = 0
      keys.each do |key|
        shifts << key += date_squared.to_s[index].to_i
        index += 1
      end
      shifts
  end

  def encrypt
    shifts
    chomped = @message.downcase.chars
    encrypted = chomped.each_with_index.map do |char, i|
      if i % 4 == 0
        char = rotate_a[char]
      elsif i % 4 == 1
        char = rotate_b[char]
      elsif i % 4 == 2
        char = rotate_c[char]
      elsif i % 4 == 3
        char = rotate_d[char]
      end
    end
    {:encryption => encrypted.join, :key => @random, :date => @date}
  end

  def decrypt
    chomped = @message.downcase.chars
    encrypted = chomped.each_with_index.map do |char, i|
      if i % 4 == 0
        char = reverse_rotate_a[char]
      elsif i % 4 == 1
        char = reverse_rotate_b[char]
      elsif i % 4 == 2
        char = reverse_rotate_c[char]
      elsif i % 4 == 3
        char = reverse_rotate_d[char]
      end
    end
    {:encryption => encrypted.join, :key => @random, :date => @date}
  end
end
