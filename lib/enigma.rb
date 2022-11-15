require './lib/enigma_module'
class Enigma
  include Enigma_mod

  def initialize
  end

  def encrypt(message, key = num_gen, date_key = date)
    {
      encryption: encrypt_message(message.downcase, key, date_key),
      key:        key,
      date:       date_key
    }
  end

  def decrypt(message, key = num_gen, date_key = date)
    {
      decryption: decrypt_message(message.downcase, key, date_key),
      key:        key,
      date:       date_key
    }
  end
end
