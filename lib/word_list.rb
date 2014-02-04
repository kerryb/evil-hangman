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
    patterns = all_matching_patterns_for letter
    matches = Hash[patterns.map {|p| [p, @words.grep(/^#{p}$/)] }]
    pattern, @words = matches.group_by {|_, words| words.size }.sort_by {|size, _| size }.last[1].first
    @pattern = pattern.gsub "[^#{letter}]", "."
  end

  private

  def longest_words_in words
    words.group_by {|w| w.length }.sort_by {|length, wds| wds.size }.last[1]
  end

  def all_matching_patterns_for letter
    @words.map {|w| w.gsub(/[^#{letter}]/, "[^#{letter}]") }.uniq
  end
end
