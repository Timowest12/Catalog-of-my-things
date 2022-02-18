# frozen_string_literal: true

require_relative 'item'

# MusicAlbum Class
class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :genre, :publish_date
  attr_reader :id

  def initialize(publish_date, archived = false, on_spotify = false, id=rand(1..10_000))
    super(publish_date, archived, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end
end
