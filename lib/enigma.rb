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

  def offset_key
    date_sq.digits.reverse.last(4).join
  end

  def offset
    {
      :offset_a => offset_key[0].to_i,
      :offset_b => offset_key[1].to_i,
      :offset_c => offset_key[2].to_i,
      :offset_d => offset_key[3].to_i
    }
  end

  def final_shift(key_arg = num_gen)
    {
      :shift_a =>  keys(key_arg).values[0] + offset.values[0],
      :shift_b =>  keys(key_arg).values[1] + offset.values[1],
      :shift_c =>  keys(key_arg).values[2] + offset.values[2],
      :shift_d =>  keys(key_arg).values[3] + offset.values[3]
    }
  end

  # def encrypt(message, key = num_gen, date)
  #   hash = {}
  #   encrypted = message
  # end
end
