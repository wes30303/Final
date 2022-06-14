require './lib/generator'

RSpec.describe Generator do

  before :each do
     @generator = Generator.new("hello world", "02715", "040895")
     @generator2 = Generator.new("keder ohulw", "02715", "040895")
  end

  it "exist" do
    expect(@generator).to be_a Generator
  end

  it "can make keys" do
    expect(@generator.keys.first).to be_a Numeric
  end

  it "has a date to be sqared" do
    expect(@generator.date_squared).to eq(1025)
  end

  it "can be a date" do
    expect(@generator.date).to eq("040895")
  end

  it "can do a random number" do
    expect(@generator.random_num).to be_a Integer
  end

  it "can show the shifts" do
    expect(@generator.shifts.first).to be_a Numeric
  end

  it "can rotate hello world" do
    expect(@generator.rotate_a).to be_a Hash
    expect(@generator.rotate_b).to be_a Hash
    expect(@generator.rotate_c).to be_a Hash
    expect(@generator.rotate_d).to be_a Hash
  end

  it "can reverse keder ohulw rotate " do
    expect(@generator.reverse_rotate_a).to be_a Hash
    expect(@generator.reverse_rotate_b).to be_a Hash
    expect(@generator.reverse_rotate_c).to be_a Hash
    expect(@generator.reverse_rotate_d).to be_a Hash
  end

  it "is able to return a hash" do
    expect(@generator.encrypt).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
   })
  end

  it "is able to return a hash" do
    expect(@generator2.decrypt).to eq({
      encryption: "hello world",
      key: "02715",
      date: "040895"
   })
  end
end
