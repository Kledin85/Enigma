require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  xit "can encrypt a message" do
    enigma = Enigma.new

    expect(enigma.encrypt("kyle", "02715", "111122")).to eq()
  end

  it 'has a character set' do
    enigma = Enigma.new

    expect(enigma.character_set.first).to eq("a")
    expect(enigma.character_set.last).to eq (" ")
  end

  it 'generate a random 5 digit number' do
    enigma = Enigma.new

    expect(enigma.num_gen).to be_a(String)
  end

  it "has a keys hash" do
    enigma = Enigma.new

    expect(enigma.keys).to be_a(Hash)
    expect(enigma.keys("02175")[:key_A]).to eq(02)
  end


end
