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

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end
end