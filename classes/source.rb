# Class Source

class Source 
    attr_accessor :name
    attr_reader :id
    @@items = []

    def initialize(name)
        @id = rand(1..1_000)
        @name = name
    end

    def add_item(item)
        @@items << item unless @@items.include?(item)
    end
end