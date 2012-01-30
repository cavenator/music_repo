class RemoveDescriptionFromMusics < ActiveRecord::Migration
  def self.up
      remove_column :musics, :description
  end

  def self.down
  	add_column :musics, :description, :text
  end
end
