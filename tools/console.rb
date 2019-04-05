require 'pry'

require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

amazon = Startup.new("Amazon", "Jeff Bezos", "www.amazon.com")
microsoft = Startup.new("Microsoft", "Bill Gates", "www.microsoft.com")
facebook = Startup.new("Facebook", "The Zuck", "www.facebook.com")

steve = VentureCapitalist.new("Steve Jobs", 40000000000)
jeff = VentureCapitalist.new("Jeff Marks", 60000000000)
goldfinger = VentureCapitalist.new("Goldfinger", 100000000)

microsoft.sign_contract(jeff, "XBox", 1000000)
facebook.sign_contract(jeff, "Messenger App", 500000)
microsoft.sign_contract(goldfinger, "motion tracker", 1000000)

jeff.offer_contract(microsoft, "Mind Control", 2500000000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line
