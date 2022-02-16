# frozen_string_literal: true

# Item class
class Item
  attr_accessor :publish_date, :archived
  attr_reader :id
  attr_writer :label, :author, :genre, :source

  def initialize(publish_date, archived: false)
    @id = rand(1..10_000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    @publish_date < (Time.now - (10 * 365.25 * 24 * 60 * 60))
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label(label)
    @label = label
  end

  def author(author)
    @author = author
  end

  def genre(genre)
    @genre = genre
  end

  def source(source)
    @source = source
  end
end
