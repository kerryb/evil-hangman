class WordList
  attr_reader :words

  def initialize words
    @words = longest_words_in words
    @pattern = "." * @words.first.length
  end

  def to_s
    @pattern
  end

  def guess letter
    new_words = @words.reject {|w| w.include? letter }
    if new_words.any?
      @words = new_words
    end
  end

  private

  def longest_words_in words
    words.group_by {|w| w.length }.sort_by {|length, wds| wds.size }.last[1]
  end
end
