class FundingRound

  attr_reader :startup, :venture_capitalist
  attr_accessor :type

  def initialize(startup, venture_capitalist)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = "Angel"
  end

  def investment()

  end

end
