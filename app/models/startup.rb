require 'pry'

# - `Startup#name`
#   - returns a **string** that is the startup's name
# - `Startup#founder`
#   - returns a **string** that is the founder's name
#   - Once a startup is created, the founder cannot be changed.
# - `Startup#domain`
#   - returns a **string** that is the startup's domain
#   - Once a startup is created, the domain cannot be changed.
# - `Startup#pivot`
#   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup
# - `Startup.all`
#   - should return **all** of the startup instances
# - `Startup.find_by_founder`
#   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
# - `Startup.domains`
#   - should return an **array** of all of the different startup domains

class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    @@all.find do |startup|
      startup.founder == founder
      # binding.pry
    end
  end

  def self.domains
    @@all.map do |startup|
      startup.domain
    end
  end


# Startup#sign_contract
# given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
  def sign_contract(venture_capitalist, type, investment, startup)
    FundingRound.new(venture_capitalist, type, investment, startup)
  end

# Startup#num_funding_rounds
# Returns the total number of funding rounds that the startup has gotten
  def num_funding_rounds
    FundingRound.all.count do |rounds|
      rounds.startup == self && rounds.type
    end
  end

# Startup#total_funds
# Returns the total sum of investments that the startup has gotten
  def total_funds
    startup_round = FundingRound.all.map do |rounds|
      rounds.startup == self && rounds.investment
    end

    startup_funds = startup_round.select do |funds|
      funds.class == Float
    end

    total_funds = startup_funds.inject(:+)

  end

# Startup#investors
# Returns a unique array of all the venture capitalists that have invested in this company
  def investors
    FundingRound.all.map do |rounds|
      if rounds.startup == self
        rounds.venture_capitalist.name
      end
    end.compact
  end


# Startup#big_investors
# Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

  def big_investors
    #find the vc that is funding the startup
    #check if the vc is tres_commas_club
    #return vc name in array if true

    VentureCapitalist.tres_commas_club.map do |vc|
      investors.select do |investor|
        investor == vc.name
      end
    end.flatten
  end
  
end
