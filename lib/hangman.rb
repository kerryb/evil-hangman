class Hangman
  def initialize words
    @words = words
  end

  def word
    "-" * longest_word_length
  end

  private

  def longest_word_length
    @words.map(&:length).group_by {|n| n }.sort_by {|length, lengths| lengths.size }.last[0]
  end
end
