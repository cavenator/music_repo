class AddAlbumToMusics < ActiveRecord::Migration
  def self.up
    add_column :musics, :album, :string
  end

  def self.down
    remove_column :musics, :album
  end
end
