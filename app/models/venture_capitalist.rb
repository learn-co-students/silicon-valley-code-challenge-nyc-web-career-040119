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
end
