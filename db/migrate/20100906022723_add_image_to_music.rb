class AddImageToMusic < ActiveRecord::Migration
  def self.up
    add_column :musics, :image, :string
  end

  def self.down
    remove_column :musics, :image
  end
end
