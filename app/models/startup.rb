require 'pry'

class Startup
  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder)
    @@all.find { |name| name.founder == founder }
  end

  def self.domains
    @@all.map { |startup| startup.domain }
  end

  def sign_contract(venture_capitalist, type, amount)
    FundingRound.new(self,venture_capitalist,type,amount)
  end

  def num_funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end.length
  end

  def total_funds
    total = 0

    FundingRound.all.select do |funding_round|
      if funding_round.startup == self
        total += funding_round.investment
      end
    end
    total
  end

  def investors
    FundingRound.all.map { |round| round.venture_capitalist if round.startup == self }.uniq.compact
  end

  def big_investors
    VentureCapitalist.tres_commas_club.select do |v_c|
      self.investors.include?(v_c.name)
    end

  end
end
