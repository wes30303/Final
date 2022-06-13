require './lib/generator'
require 'date'
require './lib/rotate'
class Enigma

  def encrypt(message, random = random_num, date = date_setup)
    @generator = Generator.new(message, random, date).encrypt
  end



end
