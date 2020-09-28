require 'rspec'
require 'parcel'

describe '#Parcel' do 

  before(:each) do
    Parcel.clear()
  end

  describe('#save') do
    it("saves a parcel to hash") do
      parcel_one = Parcel.new("parcel for you!",5,4,6,56, nil)
      parcel_one.save()
      parcel_two = Parcel.new("parcel two for me!",6,7,8,87, nil)
      parcel_two.save()
      expect(Parcel.all).to(eq([parcel_one, parcel_two]))
    end
  end

  describe('#==') do
    it("is the same parcel if it has the same attributes as the other parcel") do
      parcel_one = Parcel.new("same",5,6,7,8, 1)
      parcel_two = Parcel.new("same",5,6,7,8, 1)
      expect(parcel_one).to(eq(parcel_two))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no parcels") do
    expect(Parcel.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a parcel by id") do
      album = Album.new("parcel_three", nil)
      album.save()
      album.update("parcel_five")
      expect(album.name).to(eq("parcel_five"))
    end
  end
end