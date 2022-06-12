require "pry"
require 'date'
class Generator
  attr_reader :a_z, :random

  def initialize(message, random = random_num , date = date_to_format)
    @message = message
    @a_z = ("a".."z").to_a << " "
    @random = random
    @date = date
  end

  def random_num
    @random = (0..5).map {rand(0...9)}.join.to_i
  end

  def date_to_format
      @date = (Time.new).strftime("%d%m%y").to_i
  end

  def date_squared(date = @date)
    info = date.to_i * date.to_i
    last = info.to_s[-4..-1].to_i
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
  end

  def rotate_a
    shifts
    @A_hash = Hash[@a_z.zip(@a_z.rotate(shifts[0]))]
  end

  def rotate_b
    shifts
    @B_hash = Hash[@a_z.zip(@a_z.rotate(shifts[1]))]
  end

  def rotate_c
    shifts
    @C_hash = Hash[@a_z.zip(@a_z.rotate(shifts[2]))]
  end

  def rotate_d
    shifts
    @D_hash = Hash[@a_z.zip(@a_z.rotate(shifts[3]))]
  end

end
