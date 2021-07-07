# - `VentureCapitalist#name`
#   - returns a **string** that is the venture capitalist's name
# - `VentureCapitalist#total_worth`
#   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)
# - `VentureCapitalist.all`
#   - returns an array of all venture capitalists
# - `VentureCapitalist.tres_commas_club`
#   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)

class VentureCapitalist
  attr_reader :name, :total_worth

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
    @@all.select do |investors|
      investors.name if investors.total_worth > 1000000000 #billion
    end
  end


# - `VentureCapitalist#offer_contract`
#   - given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.

  def offer_contract(venture_capitalist, type, investment, startup)
    FundingRound.new(venture_capitalist, type, investment, startup)
  end

# - `VentureCapitalist#funding_rounds`
#   - returns an array of all funding rounds for that venture capitalist

  def funding_rounds
    FundingRound.all.select do |rounds|
      rounds.venture_capitalist == self
    end
  end

# - `VentureCapitalist#portfolio`
#   - Returns a **unique** list of all startups this venture capitalist has funded

  def portfolio
    FundingRound.all.map do |rounds|
      if rounds.venture_capitalist == self
        rounds.startup.name
      end
    end.compact.uniq
  end

# - `VentureCapitalist#biggest_investment`
#   - returns the largest funding round given by this venture capitalist

# look through funding rounds for our investments
# return the funding rounds that we invested the most

  def biggest_investment
    self.funding_rounds.max_by do |rounds|
      rounds.investment
    end
  end

# - `VentureCapitalist#invested`
#   - given a **domain string**, returns the total amount invested in that domain

  #find if the domain matches the argument domain
  #then find all investments made to that domain
  #sum the investments

  def invested(domain)
    self.funding_rounds.map do |rounds|
      if rounds.startup.domain == domain
        rounds.investment
      end
    end.compact.inject(:+)
  end

end
