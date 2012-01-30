class SelectedList
	attr_reader  :songs
	
	def initialize
		@songs = []
	end
	
	def add_songs_to_list(song)
		 current = nil
		 @songs.each_with_index do |item, index|
			
			if song.id == item.id
				current = item
			end
		 end
		 
		unless current
			@songs << song
		end
	end
end