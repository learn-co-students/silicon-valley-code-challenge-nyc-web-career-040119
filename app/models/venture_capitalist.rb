class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  # INSTANCE METHODS
  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def all_funding_rounds_for_vc
    FundingRound.all.select do |fr|
      fr.venture_capitalist.name == self.name
    end
  end

  def funding_rounds
    all_funding_rounds_for_vc
  end

  def portfolio
    all_funding_rounds_for_vc.map do |fr|
     fr.startup
   end.uniq
  end

  def biggest_investment
    all_funding_rounds_for_vc.map do |fr|
      fr.investment
    end.max
  end

  def invested(domain)
    FundingRound.all.select do |fr|
      if fr.startup.domain == domain
        fr.investment
      end
    end.map do |investments|
      investments.investment
    end.sum
  end

  # CLASS METHODS
  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |vc|
      vc.total_worth > 1000000000
    end
  end
end
