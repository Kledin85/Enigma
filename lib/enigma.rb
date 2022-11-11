class Enigma

  def initialize
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def num_gen
    rand.to_s[2..6]
  end

  def keys(key = num_gen)
    {
      :key_a => key.scan(/../)[0].to_i,
      :key_b => key.scan(//)
    }
    # require 'pry' ; binding.pry
  end

  def encrypt(message, key = num_gen, month)
    hash = {}
    encrypted = message
  end
end
