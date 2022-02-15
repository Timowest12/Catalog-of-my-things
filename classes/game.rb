# frozen_string_literal: true

require_relative 'item'

# Game class
class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super() && (@last_played_at < (Time.now - (2 * 365.25 * 24 * 60 * 60)))
  end
end
