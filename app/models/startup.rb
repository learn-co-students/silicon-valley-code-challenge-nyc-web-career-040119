class Startup

  attr_reader :founder, :name, :domain
   
  @@all = []

  def initialize(name, founder)
    @name = name
    @founder = founder
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    all.find {|startup| startup.founder == founder}
  end

  def self.domains
    all.map {|startup| startup.domain}
  end

  def sign_contract(vc, type, amount)
    fr = FundingRound.new(self, vc)
    fr.type = type
    fr.investment = amount
  end

  def num_of_funding_rounds
    FundingRound.all.select {|fr| fr.startup == self}.length
  end

  def investors
    FundingRound.all.select {|fr| fr.startup == self}.map {|fr| fr.venture_capitalist}.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}.uniq
  end

  def total_funds
    FundingRound.all.select {|fr| fr.startup == self}.map {|fr| fr.investment}.sum
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

end
