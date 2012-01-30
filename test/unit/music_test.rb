require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  
  test "test empty set" do
  	music = Music.new
  	assert !music.valid?
  	assert music.errors.on(:title)
  	assert music.errors.on(:album)
  	assert music.errors.on(:artist)
  	assert music.errors.on(:image)
  	assert music.errors.on(:song)
  	assert music.errors.on(:genre)
  end
  
  test "test with empty title" do
  	music = Music.new
  	
  	music.album = "Ready To Roll"
  	music.artist = "Jet Black Stare"
  	music.song = "/songs/jetblackstare.mp3"
  	music.image = "/image/albumcover.jpg"
  	music.genre = "Rock"
  	
  	assert !music.valid?
  end
  
    test "test with empty album" do
    	music = Music.new
    	
    	music.title = "Like a Hurricane"
    	music.artist = "The Scorpions"
    	music.song = "/songs/like A Hurricane.mp3"
    	music.image = "/image/scorpions.jpg"
    	music.genre = "Rock"
    	
    	assert !music.valid?
  end
  
    test "test with empty song" do
    	music = Music.new
    	
    	music.title = "Jet Black Stare"
    	music.album = "Ready To Roll"
    	music.artist = "Jet Black Stare"
    	music.image = "/image/albumcover.jpg"
    	music.genre = "Rock"
    	
    	assert !music.valid?
  end
  
    test "test with empty image" do
    	music = Music.new
    	
    	music.title = "Jet Black Stare"
    	music.album = "Ready To Roll"
    	music.artist = "Jet Black Stare"
    	music.song = "/songs/jetblackstare.mp3"
    	music.genre = "Rock"
    	
    	assert !music.valid?
  end
  
    test "test valid music" do
    	music = Music.new(:title => "Nothing but a Hound Dog", :album => "Best of Elvis Presley", :artist => "Elvis Presley" , :image=>"/images/30lbs lighter.jpg", :song => "/songs/private collection/HoundDog.m4a", :genre => "Rock")
    	
    	assert music.valid?
  end
  
  test "test image formats" do
  	good_image = %w{ /images/one.jpg /images/two.gif /images/three.bit}
  	bad_image = %w{ /images/two.file images/assignment.blah hello.world}
  	
  	good_image.each do |name|
  		music = Music.new(:title => "single_hit",
  				  :album => "One hit wonder",
  				  :artist => "The Wonders",
  				  :image => name,
  				  :song => "/songs/upload.m4a",
  				  :genre => "Rock"
  				)
  		assert music.valid?, music.errors.full_messages
  	end
  	
  	bad_image.each do |name|
  		bad_music = Music.new(:title => "God awful hit", :album => "Worst Album Ever", :artist=>"Marcy's Playground",:image=> name, :song => "/songs/NOW_volume50.m4a", :genre=>"New Age")
  		assert !bad_music.valid?, "problems with image: #{name}"
  	end
  end
  
    test "test song formats" do
    	good_song = %w{ /songs/Sunburn.m4a /songs/BadSanta.wav /songs/Yeah.mp3}
    	bad_song = %w{ /songs/family.guy.cam songs/youtube.mp3 hello.world}
    	
    	good_song.each do |name|
    		good_music = Music.new(:title => "single_hit",
    				  :album => "One hit wonder",
    				  :artist => "The Wonders",
    				  :image => "/images/TheWonders.jpg",
    				  :song => name,
    				  :genre => "Pop"
    				)
    		assert good_music.valid?, good_music.errors.full_messages
    	end
    	
    	bad_song.each do |name|
    		bad_music = Music.new(:title => "God awful hit", :album => "Worst Album Ever", :artist => "Tomahawk", :image=> "/images/macarana.jpg", :song => name, :genre => "Punk")
    		assert !bad_music.valid?, "problems with image: #{name}"
    	end
  end
  
end
