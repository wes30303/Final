require "pry"
require 'date'
class Generator
  attr_reader :a_z, :random

  def initialize
    @a_z = ("a".."z").to_a << " "
    @random = (0...5).map {rand(0...9)}.join.to_i
    @date = Time.new
  end

  def date_to_format
      @date.strftime("%d%m%y").to_i
  end

  def date_squared
    date_to_format * date_to_format
  end

  def last_4
    last = date_squared.to_s[-4..-1].to_i
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
end
