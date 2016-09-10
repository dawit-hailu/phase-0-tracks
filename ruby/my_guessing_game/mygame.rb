=begin
The Game class
-Initialize
	-intput
	  -word to guess
	-assignments
	   -number of tries to 0
	   -assign number of charaters as permited number of tries
	   -assin guessed word as '-' times number of charachters in word to guess
-check_word
	-input
	  -input
	  	-word to be checked
	  -assignments
	    -increament number of tries
	    -update players_word with correct letters
      -output 

Dtiver code
-Ask the user to enter a word for the game
-untill word is guessed or number of tries gets to 0
  -ask for the user to enter a word
  -checkword
=end
class GuessingGame
  attr_reader :player_wins
  attr_reader :guess_count
  attr_reader :players_word
  attr_reader :game_word
  
  def initialize(word)
  	@game_word = word
  	@guess_count = word.length
  	@players_word = "-"*game_word.length
  	@player_wins = false
  end
  def check_guess(word)
  	word.length.times do |word_index|
  	    @players_word[word_index] = word[word_index] if word[word_index] == @game_word[word_index]
  	  end
  	@guess_count -= 1
  	@player_wins = (@game_word == @players_word)
  end
end

puts "Enter a word to start the game:"
word = gets.chomp

game = GuessingGame.new(word)

until game.player_wins || game.guess_count == 0
   puts "You have #{game.guess_count} guesses left..."
   puts "so far you have #{game.players_word}  enter your gues: "
   guess = gets.chomp
   game.check_guess(guess)
end
if game.player_wins
  puts "Congratulations you guessed '#{game.game_word}' in #{game.game_word.length - game.guess_count} tries"
else
  puts "Game Over :("
end