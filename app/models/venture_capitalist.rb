class VentureCapitalist

  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    all.select {|vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
    fr = FundingRound.new(startup, self)
    fr.type = type
    fr.investment = amount
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map {|fr| fr.startup}.uniq
  end

  def biggest_investment
    funding_rounds.map {|fr| fr.investment}.max
  end

  def invested(domain)
    Startup.all.select {|startup| startup.domain == domain}.map {|startup| startup.total_funds}.sum
  end

end
