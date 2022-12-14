require './lib/enigma'
enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read
file.close

encrypted_message = enigma.encrypt(message.chomp, "02715", "040895")

file = File.open(ARGV[1], "w")
file.write(encrypted_message[:encryption])
file.close

puts "created #{ARGV[1]} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
