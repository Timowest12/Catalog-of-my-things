require 'date'
require_relative '../classes/book'

describe Book do
  context 'When testing the Book class' do
    it 'A newly created book has a published_date property of type Date' do
        book1 = Book.new(Date.new(2019, 1, 1), 'Test Publisher', 'Good', false)
        book2 = Book.new('2019-01-01', 'Test Publisher', 'Good', true)

        expect(book1.publish_date).not_to be_nil
        expect(book2.publish_date).not_to be_nil
        expect(book1.publish_date).to be_a(Date)
        expect(book2.publish_date).to be_a(Date)
    end

    it 'A book created without an archived parameter is consider not archived by default' do

        book = Book.new(Date.today.to_s, 'Test Publisher', 'Good')
        expect(book.archived).to be(false)
    end

    it 'A Book is also an Item (inheritance check)' do
        book = Book.new(Date.today.to_s, 'Test Publisher', 'Bad', true)
        expect(book).to be_kind_of(Item)
    end
  end
end
