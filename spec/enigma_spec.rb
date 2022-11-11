require './lib/enigma'
require 'time'

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
    expect(enigma.keys("02715").values[0]).to eq(02)
    expect(enigma.keys("02715").values[1]).to eq(27)
    expect(enigma.keys("02715").values[2]).to eq(71)
    expect(enigma.keys("02715").values[3]).to eq(15)

  end

  it 'can get the date as MMDDYY' do
    enigma = Enigma.new

    expect(enigma.date).to eq("111122")
  end

  it 'can square the date' do
    enigma = Enigma.new

    expect(enigma.date_sq).to eq(12348098884)
  end

  it 'can grab the last four digits of date_sq' do
    enigma = Enigma.new

    expect(enigma.offset_key).to eq("8884")
  end

  it 'has an offset hash' do
    enigma = Enigma.new

    expect(enigma.offset).to be_a(Hash)
    expect(enigma.offset.values[0]).to eq(8)
    expect(enigma.offset.values[1]).to eq(8)
    expect(enigma.offset.values[2]).to eq(8)
    expect(enigma.offset.values[3]).to eq(4)

  end

  it 'has a final shift hash' do
    enigma = Enigma.new

    expect(enigma.final_shift).to be_a(Hash)
    expect(enigma.final_shift("02715").values[0]).to eq(10)
    expect(enigma.final_shift("02715").values[1]).to eq(35)
    expect(enigma.final_shift("02715").values[2]).to eq(79)
    expect(enigma.final_shift("02715").values[3]).to eq(19)

  end
end
