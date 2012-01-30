xml.playlist(:for_song => @music.title) do
	for songs in @playlists
	   xml.playlist do
	   	xml.name(songs.playlist_title)
	   	xml.username(songs.username)
	   end
	end
end
