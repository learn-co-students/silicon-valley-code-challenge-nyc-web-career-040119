
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
    FundingRound.all.select {|round|round.startup == self}.length
  end

  def total_funds
    sum = 0
    FundingRound.all.select {|round|round.startup == self}.map{|obj|obj.investment}.each{|num|sum += num}
    sum
  end

  def investors
    FundingRound.all.select {|round|round.startup == self}.map {|invest|invest.venture_capitalist}.uniq
  end


  def big_investors
    VentureCapitalist.tres_commas_club.select {|big_investors|self.investors.include?(big_investors)}.uniq
  end

end
