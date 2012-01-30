class CreateSongLists < ActiveRecord::Migration
  def self.up
    create_table :song_lists do |t|
    
      t.integer :music_id, :null => false, :options => "CONSTRAINT fk_song_list_musics REFERENCES musics(id)"
      t.integer :play_list_id, :null => false, :options => "CONSTRAINT fk_song_list_play_lists REFERENCES play_lists(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :song_lists
  end
end
