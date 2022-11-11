require './lib/enigma'

RSpec.describe Enigma do

  it 'exist' do
    enigma = Enigma.new("hello world", "12345", "111122")

    expect(enigma).to be_a(Enigma)
  end
end
