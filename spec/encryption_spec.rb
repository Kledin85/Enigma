require 'encryption'

RSpec.describe Encryption do

  it 'exists' do
    encryption = Encryption.new

    expect(encryption).to be_a(Encryption)
  end

  it 'has a character set' do
    encryption = Encryption.new

    expect(encryption.character_set.first).to eq(["a"])
    expect(encryption.character_set.last).to eq ([" "])
  end
end
