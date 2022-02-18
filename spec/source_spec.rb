require_relative '../classes/source'

describe Source do
  before :each do
    @source = Source.new('Internet')
  end

  it 'Test if object is instance of correct class' do
    expect(@source).to be_an_instance_of Source
  end

  it 'Source name should be correct' do
    expect(@source.name).to eq('Internet')
  end

  it 'The add_items method should add item to @@items' do
    item1 = Item.new(Date.today.to_s, true);
    @source.add_item(item1)
    items = Source.class_variable_get(:@@items)
    expect(items).to include(item1)
  end
end
