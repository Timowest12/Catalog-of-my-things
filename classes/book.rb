require_relative 'item'

# Book class that inherits from Item
class Book < Item
    attr_accessor :publisher, :cover_state
    attr_reader :id
    
    def initialize(publish_date, publisher, cover_state, archived = false, my_id = rand(1..10_000))
        super(publish_date, archived, my_id)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        super and @cover_state == 'bad'
    end
end
