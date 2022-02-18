# rubocop: disable Style/ClassVars
# Class Genre
class Genre
  attr_accessor :name
  attr_reader :id

  @@items = []

  def initialize(name, my_id = rand(1..10_000))
    @id = my_id
    @name = name
  end

  def add_item(item)
    item.assign_genre(self)
    @@items << item unless @@items.include?(item)
  end
end
# rubocop: enable Style/ClassVars
