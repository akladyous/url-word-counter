class Stats < WordsCounted::Counter

  # inherited instance methods
  # token_count
  # uniq_token_count
  # char_count
  # token_frequency
  # token_lengths
  # token_density
  # most_frequent_tokens
  # longest_tokens
  # average_chars_per_token

  DELIMITERS = ['-', '—', '―', '~', '\\', '/', '|', '+', '\'', '‘', '’', ' ']
  SEPARATOR = '-'
  TOKEN_REGEXP = /[\p{Alpha}\-']+/

  attr_accessor :slug
  attr_reader   :tokens

  def initialize(slug)
    @slug = slug
    super
  end

  def top(num = 25)
    num = self.tokens.size >= 25 ? num : self.tokens.size
    token_frequency.first(num).to_h
  end

  def summary
    {
      token_count: self.token_count,
      uniq_token_count: self.uniq_token_count,
      characters_count: self.char_count,
      average_chars_per_token: self.average_chars_per_token
    }
  end

  def self.tokenize(slug, separator: SEPARATOR, **options )
    token = slug.downcase.strip.gsub(separator, ' ') if DELIMITERS.include? separator
    tokenized = WordsCounted::Tokeniser.send(:new, token).tokenise(**options)
    send(:new, tokenized)
  end
end
