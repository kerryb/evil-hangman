require "hangman"

describe Hangman do
  let(:words) { %w[foo bar baz wibble a aa] }
  subject(:game) { Hangman.new words }

  it "starts with the most popular number of letters" do
    expect(game.word).to eq "---"
  end
end
