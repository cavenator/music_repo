class Music < ActiveRecord::Base
	#has_many :play_lists
	has_many  :song_lists
	has_many  :play_lists, :through => :song_lists
	
	validates_presence_of :song, :title, :album, :image, :artist, :genre
	validates_format_of :song,
			:with => %r{\/songs\/.*\.(mp3|wav|m4a)$}i,
			:message => 'must start with /songs/ and must be a URL for MP3, WAV or M4a music format.'

	validates_format_of :image,
			:with => %r{\/images/.*\.(gif|jpg|bit)$}i,
			:message => 'must be a URL for GIF, JPG or BIT image format.'

	def self.find_music_for_store
		find(:all, :order => "title")
	end

end
