require 'pry'
class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select do |rich_people|
      rich_people.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, amount)
    # startup, venture_capitalist, type, investment
    FundingRound.new(startup, self.name, type, amount)
  end

  def funding_rounds
    FundingRound.all.select { |round| round if round.venture_capitalist == self.name  }
  end

  def portfolio
    FundingRound.all.map { |round| round.startup if round.venture_capitalist == self.name  }.uniq.compact!
  end

  def biggest_investment
    # highest = 0
    this_investor = []
    FundingRound.all.map do |round|
      if round.venture_capitalist == self.name
        this_investor << round
        # money = round.investment
        # if money > highest
        #   highest = money
        # end
        # highest = round.investment if round.investment > highest
      end
    end
    # highest
    this_investor.sort_by { |round| round.investment }.last
  end

  def invested(string)
    total = 0
    FundingRound.all.map do |round|
      if round.startup.domain == string
        total += round.investment
      end
    end
    total
  end

end
