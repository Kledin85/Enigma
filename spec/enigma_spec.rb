require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it "can encrypt a message" do
    enigma = Enigma.new

    expect(enigma.encrypt("kyle", "02715", "111122")).to eq("ufjx")
  end

end
