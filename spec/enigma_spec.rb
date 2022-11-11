require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it "can encrypt a message" do
    enigma = Enigma.new

    expect(enigma.encrypt("kyle", "02715", "111122")).to eq()
  end

  it 'has a character set' do
    encryption = Encryption.new("hello", "12345", "111122")

    expect(encryption.character_set.first).to eq("a")
    expect(encryption.character_set.last).to eq (" ")
  end

end
