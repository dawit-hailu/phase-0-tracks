require_relative 'mygame'
describe GuessingGame do
  let(:game) {GuessingGame.new("game-word")}
  it "initializes game with word" do
  	expect(game.game_word).to eq "game-word"
  end

  it "initializes players word with '-'" do
  	expect(game.players_word).to eq "---------"
  end

  it "checks playes word with game word and updates correct characters" do
  	game.check_guess("guessword")
  	expect(game.players_word).to eq "g----word"
  end

  it "it sets number of tries possible to game word length" do
  	expect(game.guess_count).to eq 9
  end

  it "decrements number of tries left every try" do 
  	game.check_guess("trial1")
  	game.check_guess("trial2")
  	expect(game.guess_count).to eq 7
  end

  it "updates player_wins when player guesses correctly" do
  	game.check_guess("game-word")
  	expect(game.player_wins).to eq true
  end
end