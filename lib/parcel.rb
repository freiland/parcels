class Parcel 
  attr_reader :id
  attr_accessor :name, :width, :length, :height, :weight
  @@parcels = {}
  @@total_rows = 0

  def initialize(name, width, height, length, weight, id)
    @name = name
    @width = width 
    @height = height 
    @length = length 
    @weight = weight 
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.name, self.width, self.height, self.length, self.weight, self.id)
  end

  def ==(parcel_to_compare)
    (self.name() == parcel_to_compare.name()) && (self.width == parcel_to_compare.width) && (self.height == parcel_to_compare.height) && (self.length == parcel_to_compare.length) && (self.weight == parcel_to_compare.weight) && (self.id == parcel_to_compare.id)
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(name)
    self.name = name
    @@parcels[self.id] = Parcel.new(self.name, self.width, self.height, self.length, self.weight, self.id)
  end

  def delete()
    @@parcels.delete(self.id)
  end

  def volume()
    @length*@width*@height
  end

  def cost_to_ship()
    cost = 

end