# Class Source

class Source 
    attr_accessor :name
    attr_reader :id
    @@items = []

    def initialize(name, id=rand(1..10_000))
        @id = id
        @name = name
    end

    def add_item(item)
        item.source(self)
        @@items << item unless @@items.include?(item)
    end
end