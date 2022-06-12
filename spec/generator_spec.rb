require './lib/generator'

RSpec.describe Generator do

  before :each do
    @generator = Generator.new
  end

  it "exist" do
    expect(@generator).to be_a Generator
  end

  it "has a date" do
    expect(@generator.date_to_format).to be_a Numeric
  end

  it "is able to get the square of date" do
    expect(@generator.date_squared).to be_a Numeric
  end

  it "can grab the last 4 digets from sqared" do
    expect(@generator.last_4).to be_a Numeric
  end
end
