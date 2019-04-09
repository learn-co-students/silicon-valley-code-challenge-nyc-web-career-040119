require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

crapco = Startup.new("Crap", "Mark Z.", "www.crap-comp.com")
instagram = Startup.new("Instagram", "blah", "www.instagram.com")
facebook = Startup.new("Facebook", "Mark Z.", "www.facebook.com")

soyeong = VentureCapitalist.new("Soyeong Oh", 50000000000)
shao = VentureCapitalist.new("ShaoBo Fang", 100000)
sam = VentureCapitalist.new("Sam Doe", 10000000000000)

fr1 = FundingRound.new(instagram, soyeong, "Series A", 30000)
fr2 = FundingRound.new(facebook, shao, "Series A", 10000)
fr3 = FundingRound.new(facebook, soyeong, "Series B", 400000)
fr4 = FundingRound.new(facebook, soyeong, "Series C", 400000)
fr5 = FundingRound.new(facebook, sam, "Series C", 800000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
