require './lib/enigma'

RSpec.describe Enigma do

  it 'exist' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end
end
