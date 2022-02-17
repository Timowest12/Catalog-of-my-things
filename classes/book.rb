require_relative 'item'

# Book class that inherits from Item
class Book < Item
    attr_accessor :publisher, :cover_state
    attr_reader :id
    
    def initialize(publish_date, publisher, cover_state, archived = false, my_id = rand(1..10_000))
        if(publish_date.is_a?(String))
          super(Date.parse(publish_date), archived, my_id)
        else
          super(publish_date, archived, my_id)
        end
        
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        super and @cover_state == 'bad'
    end
end
