class VentureCapitalist

  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = 1000000
    @@all << self
  end

  def self.all
    @@all
  end

  def tres_commas_club
    all.select {|vc| vc.total_worth > 1000000000}
  end

end
