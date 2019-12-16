class Parcel
  attr_reader(:size, :weight, :id)

  @@parcels = {}
  @@total_rows = 0

  def initialize(length, width, height, weight, id)
    @size = {
      "length" => length,
      "width" => width,
      "height" => height
    }
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.size["length"], self.size["width"],self.size["height"], self.weight, self.id)
  end

  def ==(parcel_to_compare)
    self.id() == parcel_to_compare.id()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def update(field, value)
    if field == 'weight'
      @weight = value
    else
      @size[field] = value
    end
  end

  def delete
    @@parcels.delete(self.id)
  end

  def self.find(id)
    @@parcels[id]
  end


end
