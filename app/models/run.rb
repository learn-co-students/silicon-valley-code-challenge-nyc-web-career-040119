require_relative 'funding_round.rb'
require_relative 'startup.rb'
require_relative 'venture_capitalist.rb'
require 'pry'


fis = Startup.new("flatiron","someone","coding")
tesla = Startup.new("tesla","person1","cars")
apple = Startup.new("apple","Steve Jobs","tech")
windows = Startup.new("windows","bill","tech")

cap1 = VentureCapitalist.new("joe", 5000000)
cap2 = VentureCapitalist.new("jim",2000000000)
cap3 = VentureCapitalist.new("gary",100)

round1 = FundingRound.new(fis,cap1,"Series A",10000)
round2 = FundingRound.new(tesla,cap2,"Series B",2000000)
round3 = FundingRound.new(apple,cap3,"Series C",2000)
round4 = FundingRound.new(fis,cap2,"Series B",100)
round5 = FundingRound.new(fis,cap3,"Series C",1000)


binding.pry
0
