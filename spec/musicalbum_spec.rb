require_relative '../classes/musicalbum'


describe MusicAlbum do
  before :each do
    @musictest = MusicAlbum.new(2002-01-01,true,true)
  end

  it 'music should be an instance of Music class' do
    expect(@musictest).to be_an_instance_of MusicAlbum
  end

  it 'expect publish date to be a date' do
    expect(@musictest.publish_date).to be_a(Date)
  end

  it 'check if on_spotify works correctly' do
    expect(@musictest.on_spotify?).to be true
  end
end