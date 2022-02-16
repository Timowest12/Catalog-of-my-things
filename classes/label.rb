# Label class
class Label
    attr_accessor :title, :color

    @@items = []
  
    def initialize(title, color)
      @id = rand(1..10_000)
      @title = title
      @color = color
    end
  
    def add_item(item)
      item.label(self)
      @@items << item unless @@items.include?(item)
    end
  end
