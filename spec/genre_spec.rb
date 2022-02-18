require_relative '../classes/genre'

describe Genre do
  before :each do
    @genre = Genre.new('country')
  end

  it 'test if object is instance of correct class' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'genre name should be correct' do
    @name == 'country'
  end

  it 'The add_items method should add item to @@items' do
    item1 = Item.new(Date.today.to_s, true);
    @genre.add_item(item1)
    items = Genre.class_variable_get(:@@items)
    expect(items).to include(item1)
  end
end
