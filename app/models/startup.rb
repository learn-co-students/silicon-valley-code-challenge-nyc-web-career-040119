
class Startup
  attr_reader :name,:founder,:domain

  @@all = []
  @@domains = []

  def initialize(name,founder,domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
    @@domains << self.domain
  end

  def pivot(domain,name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    @@all.select do |startup|
      startup.founder == founder
    end
  end

 def self.domains
   @@domains.uniq
 end


  def sign_contract(capitalist,type,invested)
    FundingRound.new(self,capitalist,type,invested)
  end

  def num_funding_rounds
    FundingRound.all.select do |round|
      # binding.pry
      round.startup == self
    end.length
  end

  def total_funds
    sum = 0
    FundingRound.all.select do |round|
      round.startup == self
    end.map do |obj|
      obj.investment
    end. each do |num|
      sum += num
    end
    sum
  end

  def investors
    FundingRound.all.select do |round|
      round.startup == self
    end.map do |invest|
      invest.venture_capitalist
    end.uniq
  end


  def big_investors
    VentureCapitalist.tres_commas_club.select do |big_investors|
      self.investors.include?(big_investors)
    end.uniq

  end

end
