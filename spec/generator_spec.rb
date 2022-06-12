require './lib/generator'

RSpec.describe Generator do

  before :each do
    @generator = Generator.new("hello world")
  end

  it "exist" do
    expect(@generator).to be_a Generator
  end

  it "has a date" do
    expect(@generator.date_to_format).to be_a Numeric
  end

  it "is able to get the square of date" do

    expect(@generator.date_to_format).to be_a Numeric
    expect(@generator.date_squared).to be_a Numeric
  end


  it "can make keys" do
    expect(@generator.keys.first).to be_a Numeric
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
end
