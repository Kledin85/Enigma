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
      :key_a => key[0..1].to_i,
      :key_b => key[1..2].to_i,
      :key_c => key[2..3].to_i,
      :key_d => key[3..4].to_i
    }
    # require 'pry' ; binding.pry
  end

  def date
    "#{Time.now.strftime("%m%d%y")}"
  end

  def date_sq
    date.to_i ** 2
  end

  def encrypt(message, key = num_gen, date)
    hash = {}
    encrypted = message
  end
end
