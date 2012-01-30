class CreatePlayLists < ActiveRecord::Migration
  def self.up
    create_table :play_lists do |t|
#      t.integer :music_id, :null => false, :options => "CONSTRAINT fk_play_list_musics REFERENCES musics(id)"
      t.string :username, :null => false, :limit => 50
      t.string :playlist_title, :null => false, :limit => 50

      t.timestamps
    end
  end

  def self.down
    drop_table :play_lists
  end
end
