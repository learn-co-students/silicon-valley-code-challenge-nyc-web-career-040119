require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

startup1 = Startup.new("name1", "founder1")
vc1 = VentureCapitalist.new("vc_name1")
fr1 = FundingRound.new(startup1, vc1)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
