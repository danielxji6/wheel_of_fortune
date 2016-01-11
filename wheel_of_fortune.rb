class WheelOfFortune
  attr_reader :theme, :phrase, :guesses

  def initialize(game)
    @theme = game[:theme]
    @phrase = game[:phrase]
    @guesses = []
  end

  def to_s
    output = ""
    @phrase.each_char do |c|
      @guesses.any? { |g| c.downcase == g } || c == " " ? output += c : output += "_"
    end
    output
  end

  def can_i_have?(input)
    @guesses.push(input.downcase)
    @phrase.downcase.include? input.downcase
  end

  def game_over?
    self.to_s == @phrase
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
