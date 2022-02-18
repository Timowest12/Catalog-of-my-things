require 'date'
require_relative '../classes/author'

describe Author do
  context 'When testing the Author class' do
    it 'The add_items method should add items to @@items' do
        author = Author.new('John', 'Doe')
        item1 = Item.new(Date.today.to_s, true);
        
        author.add_item(item1)
        items = Author.class_variable_get(:@@items)
        expect(items).to include(item1)
    end
  end 
end