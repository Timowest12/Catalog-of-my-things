require_relative 'item'

class Genre
  attr_accessor :name

  @@genrearr = []

  def initialize(name)
    @name = name
  end
  def add_item(item)
    @genrearr << item
  end
end