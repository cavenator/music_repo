class AddGenreToMusics < ActiveRecord::Migration
  def self.up
  	add_column   :musics, :genre, :string
  end

  def self.down
  	remove_column   :musics, :genre
  end
end
