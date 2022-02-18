require 'date'
require_relative '../classes/label'

describe Label do
  context 'When testing the Label class' do
    it 'The add_items method should add item to @@items' do
        label = Label.new('Whatever', 'red')
        item1 = Item.new(Date.today.to_s, true);
        
        label.add_item(item1)
        items = Label.class_variable_get(:@@items)
        expect(items).to include(item1)
    end
  end 
end