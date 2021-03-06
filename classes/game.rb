# rubocop: disable Style/OptionalBooleanParameter
require_relative 'item'

# Game class
class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(publish_date, last_played_at, multiplayer = true, archived = false, my_id = rand(1..10_000))
    super(publish_date, archived, my_id)
    @last_played_at = if last_played_at.is_a?(String)
                        Date.parse(last_played_at)
                      else
                        last_played_at
                      end
    @multiplayer = multiplayer
  end

  def can_be_archived?
    nb_secs_in_year = 365.25 * 24 * 60 * 60
    diff_in_years = ((Date.today.to_time - @last_played_at.to_time) / nb_secs_in_year)
    super && diff_in_years > 2
  end
end
# rubocop: enable Style/OptionalBooleanParameter
