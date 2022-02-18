# rubocop: disable Style/ClassVars
# Author class
class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  @@items = []

  def initialize(first_name, last_name, my_id = rand(1..10_000))
    @id = my_id
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    item.assign_author(self)
    @@items << item unless @@items.include?(item)
  end
end
# rubocop: enable Style/ClassVars
