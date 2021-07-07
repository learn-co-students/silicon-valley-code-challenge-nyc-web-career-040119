
class VentureCapitalist

  attr_reader :name, :worth

  @@all = []

  def initialize(name, worth)
    @name = name
    @@all << self
    @worth = worth

  end

  def self.all
    @@all
  end



  def total_worth
    @worth
  end


  def self.tres_commas_club
    @@all.select {|cap| cap.worth > 1000000000}
  end

  def offer_contract(startup,type,investment)
    FundingRound.new(startup,self,type,investment)
  end

  def funding_rounds
    FundingRound.all.select {|round|round.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map {|fund|fund.startup}
  end

  def biggest_investment
    # big_investment = self.funding_rounds.map {|round| round.investment}.max
    self.funding_rounds.select {|round|round.investment == self.funding_rounds.map {|round| round.investment}.max}
  end


  def invested(domain)
    self.funding_rounds.count{|round|round.startup.domain == domain}
  end

end
