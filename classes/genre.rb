# frozen_string_literal: true

require_relative 'item'
# genre
class Genre
  attr_accessor :name, :genrearr, :id

  def initialize(name)
    @id = id || Random.rand(1..100)
    @name = name
    @genrearr = []
  end

  def add_item(item)
    @genrearr << item
  end
end
