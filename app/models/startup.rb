require 'pry'

class Startup
  @@all = []

  attr_accessor :name
  attr_reader :founder, :domain

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def pivot(domain, name)
    @domain = domain
    self.name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    self.funding_rounds.length
  end

  def total_funds
    # FundingRound.all.select do |round|
    #   round.startup == self
    self.funding_rounds.sum do |fund|
      fund.investment
    end
  end

  def investors
    self.funding_rounds.map do |round|
      round.venture_capitalist
    end.uniq
  end

  def big_investors
    self.investors.select do |capitalist|
      capitalist.total_worth > 1000000000
    end
  end
end
