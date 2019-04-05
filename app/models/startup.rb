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
    FundingRound.new(self, vc)
  end

  private

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

end
