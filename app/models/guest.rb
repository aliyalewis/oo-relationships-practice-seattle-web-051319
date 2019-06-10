class Guest
attr_reader :name
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def trips
    Trip.all.select do |trip|
      trip.guest == self
    end
  end

  def listings
    trips.collect do |trip|
      trip.listing
    end
  end

  def self.find_all_by_name(name)
    self.all.select do |guest|
      guest.name == name
    end
  end

  def self.pro_traveller
    self.all.select do |guest|
      guest.trips.count > 1
      binding.pry
    end
  end


end