class Parcel
  attr_reader(:size, :weight, :id, :volume, :destination, :cost)

  @@parcels = {}
  @@total_rows = 0

  def initialize(length, width, height, weight, destination, id)
    @size = {
      "length" => length,
      "width" => width,
      "height" => height
    }
    @weight = weight
    @id = id || @@total_rows += 1
    @destination = destination
    @volume = volume()
    @cost = to_currency(cost())
  end

  def self.all()
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.size["length"], self.size["width"],self.size["height"], self.weight, self.destination, self.id)
  end

  def ==(parcel_to_compare)
    self.id() == parcel_to_compare.id()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def update(length, width, height, weight)
    updates = [['length',length], ['width',width], ['height',height]]
    if weight > 0
      @weight = weight
    end
    updates.each do |field|
      if field[1] > 0
        @size[field[0]] = field[1]
      end
    end
  end

  def delete
    @@parcels.delete(self.id)
  end

  def self.find(id)
    @@parcels[id]
  end

  def volume()
    @size['length'] * @size['width'] * @size['height']
  end

  def cost()
    @volume * 0.25
  end

  def to_currency(num)
    (num * 100).to_s.split('').insert(-3,'.').join
  end

end
