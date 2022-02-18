# frozen_string_literal: true

require 'date'
require_relative '../classes/game'

describe Game do
  context 'Testing the Game class' do
    it 'A newly created game has a last_played_at and publish_date property of type Date' do
      game = Game.new(Date.parse('2012-12-12'), Date.parse('2022-12-12'), true)

      expect(game.publish_date).not_to be_nil
      expect(game.last_played_at).not_to be_nil
      expect(game.publish_date).to be_a(Date)
      expect(game.last_played_at).to be_a(Date)
    end

    it 'A Game is also an Item (inheritance check)' do
      game = Game.new(Date.parse('2012-12-12'), Date.parse('2022-12-12'), true)
      expect(game).to be_kind_of(Item)
    end
  end
end
