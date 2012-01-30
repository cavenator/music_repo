class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table :musics do |t|
      t.string :title
      t.text :description
      t.string :song

      t.timestamps
    end
  end

  def self.down
    drop_table :musics
  end
end
