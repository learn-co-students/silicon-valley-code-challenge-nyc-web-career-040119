require_relative '../config/environment.rb'


def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
eatsa = Startup.new("eatsa", "Scott", "Automated Restaurant")
wowbao = Startup.new("Wow Bao", "Geoff", "Automated Restaurant")
snot = Startup.new("snot", "Dude", "Tissue Company")
series_a_um = eatsa.sign_contract("Umbrella Corp", "Series A", 5000.00)
series_b_um = eatsa.sign_contract("Umbrella Corp", "Series B", 45000.00)
eatsa.sign_contract("Black Mesa", "Angel", 25000000000.00)
eatsa.sign_contract("We're Shmuck", "Seed", 32.00)
wowbao.sign_contract("Umbrella Corp", "Series A", 5.00)
wowbao.sign_contract("We're Shmuck", "Seed", 10.00)
snot.sign_contract("Umbrella Corp", "Series B", 45000.00)
snot.sign_contract("We're Shmuck", "Seed", 0.97)
um_corp = VentureCapitalist.new("Umbrella Corp",12193263111263526.90)
black_mesa = VentureCapitalist.new("Black Mesa",1237657123893295.37)
shmuck = VentureCapitalist.new("We're Shmuck",42.97)


Startup.find_by_founder("Scott")

binding.pry

0 #leave this here to ensure binding.pry isn't the last line
