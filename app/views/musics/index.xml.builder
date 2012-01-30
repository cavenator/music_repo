xml.music_home_page (:page_title => "Music home Page") do
	for songs in @musics
		xml.music do
			xml.song_name(songs.title)
			xml.song_album(songs.album)
			xml.song_album(songs.artist)
		end
	end
end