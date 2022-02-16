require_relative 'item'

class Genre < Item
  attr_accessor :name

  def initialize(name)
    @name = name
    @arr_igenrearr = []
  end
def add_item(item)
    @genrearr << item
  end
end