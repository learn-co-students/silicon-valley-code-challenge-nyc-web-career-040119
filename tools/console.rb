require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
xyz_company = Startup.new("XYZ Company", "Soyeong Oh", "Artificial Intelligence")
bikers_company = Startup.new("Bikers Company", "Soyeong Oh", "Bike Manufacturing")
donut_company = Startup.new("Donut Company", "Edgar Ong", "Artificial Intelligent Donuts")

# - `Startup#name`
#   - returns a **string** that is the startup's name

xyz_company.name
donut_company.name

# - `Startup#founder`
#   - returns a **string** that is the founder's name
#   - Once a startup is created, the founder cannot be changed.

xyz_company.founder
donut_company.founder

# - `Startup#domain`
#   - returns a **string** that is the startup's domain
#   - Once a startup is created, the domain cannot be changed.

xyz_company.domain
donut_company.domain

# - `Startup#pivot`
#   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup

xyz_company.pivot("Backpack Manufacturing", "Backpacker Company")

# - `Startup.all`
#   - should return **all** of the startup instances

Startup.all

# - `Startup.find_by_founder`
#   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches

Startup.find_by_founder("Soyeong Oh")

# - `Startup.domains`
#   - should return an **array** of all of the different startup domains

Startup.domains


# - `VentureCapitalist#name`
#   - returns a **string** that is the venture capitalist's name

subway_investment = VentureCapitalist.new("Subway Investment", 1000)
big_deal_investment = VentureCapitalist.new("Big Deal Investment", 5000000000)

subway_investment.name
big_deal_investment.name

# - `VentureCapitalist#total_worth`
#   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)

subway_investment.total_worth
big_deal_investment.total_worth

# - `VentureCapitalist.all`
#   - returns an array of all venture capitalists

VentureCapitalist.all

# - `VentureCapitalist.tres_commas_club`
#   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)
VentureCapitalist.tres_commas_club

# Startup#sign_contract
# given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
xyz_seed = xyz_company.sign_contract(subway_investment, "Seed", 100.0, xyz_company)

big_seed = donut_company.sign_contract(big_deal_investment, "Series A", 1000000.0, donut_company)

xyz_seed_2 = xyz_company.sign_contract(big_deal_investment, "Series A", 2000000.0, xyz_company)
#xyz_seed = variable
#subway_investment = investor
#"Seed" = investment type
#"100.0" = investment amount
#xyz_company = startup

# - `FundingRound#startup`
#   - returns the startup object for that given funding round
#   - Once a funding round is created, I should not be able to change the startup


xyz_seed.startup
big_seed.startup

# - `FundingRound#venture_capitalist`
#   - returns the venture capitalist object for that given funding round
#   - Once a funding round is created, I should not be able to change the venture capitalist
xyz_seed.venture_capitalist
big_seed.venture_capitalist


# - `FundingRound#type`
#   - returns a **string** that is the type of funding round
#   - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
xyz_seed.type
big_seed.type

# - `FundingRound#investment`
#   - returns a **number** that is the amount invested during this funding round
#   - This should be a float that is not a negative number.
xyz_seed.investment
big_seed.investment

# - `FundingRound.all`
#   - returns all of the funding rounds
FundingRound.all


# Startup#num_funding_rounds
# Returns the total number of funding rounds that the startup has gotten
xyz_company.num_funding_rounds
bikers_company.num_funding_rounds
donut_company.num_funding_rounds

# Startup#total_funds
# Returns the total sum of investments that the startup has gotten
xyz_company.total_funds
donut_company.total_funds

# Startup#investors
# Returns a unique array of all the venture capitalists that have invested in this company
xyz_company.investors
donut_company.investors

# Startup#big_investors
# Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
xyz_company.big_investors
donut_company.big_investors

binding.pry

0 #leave this here to ensure binding.pry isn't the last line
