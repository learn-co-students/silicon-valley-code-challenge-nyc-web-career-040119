require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("name1", "founder1")
startup1.num_of_funding_rounds
startup1.investors
startup1.big_investors

startup1.pivot("new_domain", "new_name")

startup2 = Startup.new("name2","founder2")

vc1 = VentureCapitalist.new("vc_name1")
vc1.offer_contract(startup1,"Angel",400.01)
vc1.offer_contract(startup2, "Seed1", 1000000.98)
vc1.total_worth = 2000000000
vc1.funding_rounds
vc1.portfolio
vc1.biggest_investment
vc1.invested("new_domain")

startup1.sign_contract(vc1, "Seed2", 5000000)
startup1.total_funds

vc2 = VentureCapitalist.new("vc_name2")
vc2.total_worth = 1000000

Startup.find_by_founder("founder1")
Startup.domains
VentureCapitalist.tres_commas_club

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
