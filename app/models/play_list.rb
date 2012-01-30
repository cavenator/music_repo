class PlayList < ActiveRecord::Base
	has_many  :song_lists
	has_many  :musics, :through => :song_lists
	
	validates_presence_of :username, :playlist_title
	
	def add_songs_from_selected_list(playlist)
		playlist.songs.each do |song|
		   ls = SongList.from_selected_list(song)
		   song_lists << ls
		end
	end
end