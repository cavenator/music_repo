class SongList < ActiveRecord::Base
	belongs_to :music
	belongs_to :play_list
	
	def self.from_selected_list(selected_song)
		ls = self.new
		ls.music = selected_song
		ls
	end
end
