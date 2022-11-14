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
  end

  def date
    "#{Time.now.strftime("%m%d%y")}"
  end

  def date_sq(date_key = date)
    date_key.to_i ** 2
  end

  def offset_key(date_key = date)
    date_sq(date_key).digits.reverse.last(4).join
    #comeback to look at why its reversing
  end

  def offset(date_key = date)
    {
      :offset_a => offset_key(date_key)[0].to_i,
      :offset_b => offset_key(date_key)[1].to_i,
      :offset_c => offset_key(date_key)[2].to_i,
      :offset_d => offset_key(date_key)[3].to_i
    }
  end

  def final_shift(key_arg = num_gen, date_key = date)
    {
      :shift_a =>  keys(key_arg).values[0] + offset(date_key).values[0],
      :shift_b =>  keys(key_arg).values[1] + offset(date_key).values[1],
      :shift_c =>  keys(key_arg).values[2] + offset(date_key).values[2],
      :shift_d =>  keys(key_arg).values[3] + offset(date_key).values[3]
    }
  end

  def shifts(message, key = num_gen, date)
    shifts = final_shift(key, date).values
    (0..message.length).each_with_object([]) do |num, array|
      array.concat(shifts) if (num % 4).zero?
    end[0...message.length]
  end

  def encrypt_message(message, key = num_gen, date)
    encrypted_message = ""
    message.chars.map.with_index do |val, index|
      shifts = shifts(message, key, date)
      encrypted_message << character_set.rotate(shifts[index] + character_set.index(val))[0]
  end
    encrypted_message
  end

  def encrypt(message, key = num_gen, date_key = date)
    {
      encryption: encrypt_message(message.downcase, key, date_key),
      key:        key,
      date:       date_key
    }
  end
end
