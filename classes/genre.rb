# Class Genre
class Genre
  attr_accessor :name

  @@items = []

  def initialize(name, id=rand(1..10_000))
    @id = id
    @name = name
  end
  def add_item(item)
    item.genre(self)
    @@items << item unless @@items.include?(item)
  end
end