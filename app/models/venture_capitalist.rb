class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.tres_commas_club
    @@all.select do |rich_people|
      rich_people.total_worth > 1000000000
    end
  end

end
