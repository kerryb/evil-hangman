require "word_list"

describe WordList do
  let(:words) { %w[foo bar baz wibble a aa] }
  subject(:word_list) { WordList.new words }

  it "starts with the most popular number of letters" do
    expect(word_list.words).to match_array %w[foo bar baz]
  end

  context "after guessing a letter that's not in any words" do
    before { word_list.guess "x" }

    it "doesn't change the word list" do
      expect(word_list.words).to match_array %w[foo bar baz]
    end
  end

  context "after guessing a letter that's in some words" do
    before { word_list.guess "a" }

    it "reduces the list to the words without the letter" do
      expect(word_list.words).to match_array %w[foo]
    end
  end

  context "after guessing a letter that's in all the words" do
    let(:words) { %w[bar baz] }
    before { word_list.guess "a" }

    it "doesn't change the word list" do
      expect(word_list.words).to match_array %w[bar baz]
    end
  end
end
