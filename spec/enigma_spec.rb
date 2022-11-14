require './lib/enigma'
require 'time'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it "can encrypt a message" do
    enigma = Enigma.new

    expect(enigma.encrypt_message("hello world", "02715", "040895")).to eq("keder ohulw")
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

    expect(enigma.date).to be_a(String)
  end

  it 'can square the date' do
    enigma = Enigma.new

    expect(enigma.date_sq("040895")).to eq(1672401025)
  end

  it 'can grab the last four digits of date_sq' do
    enigma = Enigma.new

    expect(enigma.offset_key("040895")).to eq("1025")
  end

  it 'has an offset hash' do
    enigma = Enigma.new

    expect(enigma.offset("040895")).to be_a(Hash)
    expect(enigma.offset("040895").values[0]).to eq(1)
    expect(enigma.offset("040895").values[1]).to eq(0)
    expect(enigma.offset("040895").values[2]).to eq(2)
    expect(enigma.offset("040895").values[3]).to eq(5)

  end

  it 'has a final shift hash' do
    enigma = Enigma.new

    expect(enigma.final_shift).to be_a(Hash)
    expect(enigma.final_shift("02715", "040895").values[0]).to eq(3)
    expect(enigma.final_shift("02715", "040895").values[1]).to eq(27)
    expect(enigma.final_shift("02715", "040895").values[2]).to eq(73)
    expect(enigma.final_shift("02715", "040895").values[3]).to eq(20)
  end

  it 'can make an array of every shift as long as the message' do
    enigma = Enigma.new

    expect(enigma.shifts("hello world","02715", "040895")).to eq([3, 27, 73, 20, 3, 27, 73, 20, 3, 27, 73])
  end

  it "can return a hash with the encrypted message and its key and date" do
    enigma = Enigma.new

    expect(enigma.encrypt("hello world","02715", "040895")[:key]).to eq("02715")
    expect(enigma.encrypt("hello world","02715", "040895")[:date]).to eq("040895")
    expect(enigma.encrypt("hello world","02715", "040895")[:encryption]).to eq("keder ohulw")
    expect(enigma.encrypt("HELLO WORLD","02715", "040895")[:encryption]).to eq("keder ohulw")
    # expect(enigma.encrypt("HELLO WORLD!","02715", "040895")[:encryption]).to eq("keder ohulw")


  end
end
