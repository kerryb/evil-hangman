require "word_list"

describe WordList do
  let(:words) { %w[foo bar baz wibble a aa] }
  subject(:word_list) { WordList.new words }

  it "starts with the most popular number of letters" do
    expect(word_list.words).to match_array %w[foo bar baz]
  end

  it "represents itself as the appropriate number of dots" do
    expect(word_list.to_s).to eq "..."
  end

  context "after guessing a letter that's in some words" do
    let(:words) { %w[quz bar baz cap baa aka aas] }
    before { word_list.guess "a" }

    it "picks the match(es) that leave(s) the largest number of words" do
      expect(word_list.words).to match_array %w[bar baz cap]
    end

    it "shows the guessed letter in the pattern" do
      expect(word_list.to_s).to eq ".a."
    end
  end
end
