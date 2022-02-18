require_relative '../classes/musicalbum'


describe MusicAlbum do
  before :each do
    @musictest = MusicAlbum.new(2002-01-01,true,true,true)
  end

  it 'music should be an instance of Music class' do
    expect(@musictest).to be_an_instance_of MusicAlbum
  end

  it 'expect publish date to be correct' do
    expect(@musictest.publish_date).to be(2002-01-01)
  end
  
  it 'expect on spotify to be correct' do
    expect(@musictest.on_spotify).to be(true)
  end

end