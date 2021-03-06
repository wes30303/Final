require './lib/generator'
require 'date'
require './lib/rotate'
class Enigma

  def encrypt(message, random = random_num, date = date_setup)
    @generator = Generator.new(message, random, date).encrypt
  end

  def decrypt(message, random, date)
    @generator = Generator.new(message, random, date).decrypt
  end

  def date_setup
    @date = (Time.new).strftime("%d%m%y").to_i
  end

  def random_num
    @random = (0..5).map {rand(0...9)}.join.to_i
  end

end
