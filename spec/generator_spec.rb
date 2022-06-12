require './lib/generator'

RSpec.describe Generator do

  before :each do
    @generator = Generator.new
  end

  it "exist" do
    expect(@generator).to be_a Generator
  end

  it "has a date" do
    expect(@generator.date_to_format).to eq(110622)
  end

  it "is able to get the square of date" do
    expect(@generator.date_squared).to eq(12237226884)
  end
end
