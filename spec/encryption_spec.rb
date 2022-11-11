require 'encryption'

RSpec.describe Encryption do

  it 'exists' do
    encryption = Encryption.new

    expect(encryption).to be_a(Encryption)
  end
end
