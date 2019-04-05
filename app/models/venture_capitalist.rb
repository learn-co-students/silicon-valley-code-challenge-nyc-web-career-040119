
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
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |fund|
      fund.startup
    end
  end



end
