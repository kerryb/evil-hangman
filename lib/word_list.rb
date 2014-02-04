class WordList
  attr_reader :words

  def initialize words
    @words = longest_words_in words
  end

  def guess letter
  end

  private

  def longest_words_in words
    words.group_by {|w| w.length }.sort_by {|length, wds| wds.size }.last[1]
  end
end
