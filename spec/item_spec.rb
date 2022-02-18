require 'date'
require_relative '../classes/item'

describe Item do
  context 'When testing the Item class' do
    it 'A newly created Item has a publish_date property of type Date' do
      item1 = Item.new(Date.today.to_s, true)
      item2 = Item.new('2022-02-17')

      expect(item1.publish_date).not_to be_nil
      expect(item2.publish_date).not_to be_nil
      expect(item1.publish_date).to be_a(Date)
      expect(item2.publish_date).to be_a(Date)
    end

    it 'An item published more than 10 years ago can be archived' do
      item1 = Item.new('2012-01-01')
      item2 = Item.new('2001-02-16')
      item3 = Item.new('2001-02-16')
      item4 = Item.new('1989-08-30')
      item5 = Item.new('2012-09-24')

      all_items = [item1, item2, item3, item4, item5]
      archivable_items = all_items.select(&:can_be_archived?)

      expect(archivable_items.length).to eq(all_items.length - 1)
      expect(archivable_items).to include(item1)
      expect(archivable_items).to include(item2)
      expect(archivable_items).to include(item3)
      expect(archivable_items).to include(item4)
      expect(archivable_items).not_to include(item5)
    end
  end
end
