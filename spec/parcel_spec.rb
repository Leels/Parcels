require('rspec')
require('parcel')
describe('#Parcel') do
  before(:each) do
    Parcel.clear()
  end
  describe('.all') do
    it('empty at first') do
      expect(Parcel.all).to(eq([]))
    end
  end

  it('should create a new parcel with the size stored in a hash') do
    parcel = Parcel.new(5,5,5,35,nil)
    expect(parcel.size['length']).to(eq(5))
  end

  it('should allow for the updating the weigh and size of a parcel') do
    parcel = Parcel.new(5,5,5,35,nil)
    parcel.update(nil,nil,8,nil)
    expect(parcel.size['height']).to(eq(8))
  end

  it('should delete parcel') do
    parcel = Parcel.new(5,5,5,35,10)
    parcel.save()
    parcel.delete()
    expect(Parcel.all).to(eq([]))
  end

  it('should locate parcel by id') do
    parcel = Parcel.new(5,5,5,35,nil)
    parcel.save()
    expect(Parcel.find(1)).to(eq(parcel))
  end
end
