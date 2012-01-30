class AddArtistToMusics < ActiveRecord::Migration
  def self.up
      add_column  :musics, :artist, :string
  end

  def self.down
  	remove_column   :musics, :artist
  end
end
