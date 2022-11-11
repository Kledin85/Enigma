require 'encryption'

RSpec.describe Encryption do

  it 'exists' do
    encryption = Encryption.new("hello", "12345", "111122")

    expect(encryption).to be_a(Encryption)
  end

  it 'has a character set' do
    encryption = Encryption.new("hello", "12345", "111122")

    expect(encryption.character_set.first).to eq("a")
    expect(encryption.character_set.last).to eq (" ")
  end
end
