# frozen_string_literal: true

# Item class
class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :label, :author, :genre, :source

  def initialize(publish_date, archived = false, my_id = rand(1..10_000))
    @id = my_id
    @publish_date = if publish_date.is_a?(String)
                      Date.parse(publish_date)
                    else
                      publish_date
                    end
    @archived = archived
  end

  def can_be_archived?
    nb_secs_in_year = 365.25 * 24 * 60 * 60
    diff_in_years = ((Date.today.to_time - @publish_date.to_time) / nb_secs_in_year).floor
    diff_in_years >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def assign_label(label)
    @label = label
  end

  def assign_author(author)
    @author = author
  end

  def assign_genre(genre)
    @genre = genre
  end

  def assign_source(source)
    @source = source
  end
end
