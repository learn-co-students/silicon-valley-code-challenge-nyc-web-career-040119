require 'pry'

class Startup
  attr_reader :founder
  attr_accessor :domain, :name

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  # INSTANCE METHODS
  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

# HELPER ##
  def total_num_of_funding_rounds
    FundingRound.all.select do |fr|
      fr.startup == self
    end
  end
###

  def funding_rounds
    total_num_of_funding_rounds.count
  end

  def total_funds
    total_num_of_funding_rounds.map do |fr|
      fr.investment
    end.sum
      # binding.pry
  end

  def investors
    total_num_of_funding_rounds.map do |fr|
      fr.venture_capitalist
    end.uniq
  end

  def big_investors
    investors.select do |fr|
      # binding.pry
      fr.total_worth > 1000000000
    end.uniq
  end
  # CLASS METHODS
  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |startups|
      startups.founder == founder
    end
  end

  def self.domains
    self.all.map do |startups|
      startups.domain
    end
  end
end
