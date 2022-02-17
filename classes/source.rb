# Class Source

class Source 
    attr_accessor :name
    attr_reader :id
    @@items = []

    def initialize(name, my_id = rand(1..10_000))
        @id = my_id
        @name = name
    end

    def add_item(item)
        item.assign_source(self)
        @@items << item unless @@items.include?(item)
    end
end