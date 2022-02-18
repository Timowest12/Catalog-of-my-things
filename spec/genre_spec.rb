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
end
