# frozen_string_literal: true

# Label class
class Label
  attr_accessor :title, :color
  attr_reader :id

  @@items = []

  def initialize(title, color, my_id = rand(1..10_000))
    @id = my_id
    @title = title
    @color = color
  end

  def add_item(item)
    item.assign_label(self)
    @@items << item unless @@items.include?(item)
  end
end
