class VentureCapitalist
  @@all = []

  attr_reader :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |capitalist|
      capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    self.funding_rounds.map do |round|
      round.startup
    end.uniq
  end

  def biggest_investment
    self.funding_rounds.max do |round|
      round.investment
    end
  end

  def invested(domain)
    self.funding_rounds.select do |round|
      round.startup.domain == domain
    end.sum do |round|
      round.investment
    end
  end
end
