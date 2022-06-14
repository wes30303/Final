require 'date'
require './lib/enigma'
require './lib/generator'

RSpec.describe Enigma do

  before :each do
    @enigma = Enigma.new
  end

  it 'can encrypt' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end

  it "can decrypt" do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
  end

  it "can encrypt without number and date" do
    expect(@enigma.encrypt("hello world", "02715")).to be_a Hash
  end

  it "can encrypt with only message" do
    expect(@enigma.encrypt("hello world")).to be_a Hash
  end
end
