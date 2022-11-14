require './lib/enigma'
enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read
file.close

encrypted_message = enigma.decrypt(message.chomp, ARGV[2], ARGV[3])

file = File.open(ARGV[1], "w")
file.write(encrypted_message[:encryption])
file.close

puts "created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
