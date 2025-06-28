require_relative 'lib/game'

play = Game.new

puts "Welcome to Hangman!"
puts "Do you want to start a new game or load an existing one? (new/load)"
choice = gets.chomp.downcase

if choice == "new"
  play.start_new_game
elsif choice == "load"
  play.load_game
else
  puts "Invalid choice. Please enter 'new' or 'load'."
end