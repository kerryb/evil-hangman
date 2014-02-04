class WordList
  attr_reader :words

  def initialize words
    @words = longest_words_in words
  end

  def guess letter
    new_words = @words.reject {|w| w.include? letter }
    @words = new_words unless new_words.empty?
  end

  private

  def longest_words_in words
    words.group_by {|w| w.length }.sort_by {|length, wds| wds.size }.last[1]
  end
end
