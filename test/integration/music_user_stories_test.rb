require 'test_helper'

class MusicUserStoriesTest < ActionController::IntegrationTest
  fixtures :all
  
# Deletes the SongList and PlayList and creates a @selected_list instance variable
  def setup
  	SongList.delete_all
  	PlayList.delete_all
  	@selected_list = SelectedList.new  	
  end
  
# this method tests the display page.  This is used in almost every test assertion.
  def show_display_page
     	get "/music_page/display"
     	assert_response :success
     	assert_template "display"
   	assert_equal 2, session[:music].size
  end
  
# This method adds a song to the temporary list.  It accepts the music object (fixture), the music title, and the total amount that should be in the list.  This
# is activated before viewing lists, traveling between actions, and creating playlist.
  def  add_song(song, title, length)
  	put_via_redirect "/music_page/add_previewed_music_to_list", :id => song.id
     	assert_response :success
     	assert_template "display"
     	assert_equal length, session[:selectedlist].songs.size
   	assert_equal 2, session[:music].size
   	assert_equal title, song.title
  end
  
# This method brings the user to the View Selected Songs List.  This is activated before Delete List, "Go Back", and Create Playlist functions.
  def view_temp_list(length)
        get "/music_page/view_songs"
        assert_response :success
        assert_template "view_songs"
      	assert_equal length, session[:selectedlist].songs.size
  end

# This test introduces the user to the home page.  From here, the user decides to press a button to take them to the music selection page
   test "go to music page" do
   	get "/music_page/index"
   	assert_response :success
   	assert_template "index"
   	
   	show_display_page
   end
   
# This test satisfies the story of a user at the music selection page and filtering on Artist. This covers three distinct stories
   test "filter on music" do
   
   	show_display_page

# Story Usage 1: Filter on a valid song criteria

	xml_http_request :post, "/music_page/filter_music_by_category", :title => "Alkaline", :filter => "Artist"
	assert_response :success
	assert_equal 1, session[:music].size
	assert_template "music_page/filter_music_by_category.js.rjs"
	assert_equal session[:music][0].artist, "Alkaline Trio"

# Story Usage 2:  Filter on invalid criteria

	xml_http_request :post, "/music_page/filter_music_by_category", :title => "Asylum", :filter => "Album"
	assert_response :success
	assert_template "music_page/filter_music_by_category.js.rjs"
	assert_equal 0, session[:music].size
	assert_equal 0, session[:selectedlist].songs.size
	assert_equal flash[:notice],"Invalid search criteria"

# Story Usage 3:  Filter with blank input.  This defaults to everything returning to the music selection page.
	xml_http_request :post, "/music_page/filter_music_by_category", :title => nil, :filter => "Album"
	assert_response :success
	assert_template "music_page/filter_music_by_category.js.rjs"
	assert_equal 2, session[:music].size
	assert_equal 0, session[:selectedlist].songs.size
	assert_equal flash[:notice],nil
	
   end
   
# This story represents a user going to the music page and adding a song to the temporary playlist
   test "add song to playlist" do
   	
   	show_display_page
   	
   	add_song(musics(:song_one),"Mercy Me", 1)
   end
   
# This story represents a user adding a song and then deleting the list
   test "add song then delete it" do
	
	show_display_page
      	
      	add_song(musics(:song_two), "Hot Air Balloon", 1)
      	add_song(musics(:song_one), "Mercy Me", 2)
   	
   	view_temp_list(2)
      	
      	put_via_redirect "/music_page/empty_music_selection"
      	assert_response :success
      	assert_template "display"
      	assert_equal 0, session[:selectedlist].songs.size
      	assert_equal 2, session[:music].size
   	assert_equal "Music selection has been cleared", flash[:notice]
   end

#This story represents a user adding a song and then create a playlist
   test "create playlist from temp list" do
   	
   	show_display_page
	      	
	add_song(musics(:song_one), "Mercy Me", 1)
	   	
	view_temp_list(1)
      	
      	get "/music_page/create_playlist"
      	assert_response :success
      	assert_template "create_playlist"
      	assert_equal 1, session[:selectedlist].songs.size
      	
      	post_via_redirect "/music_page/save_playlist", {:playlist => {:username => "cavenator", :playlist_title => "Sample Test"}, :playlist_title => "Sample Test"}
      	
  	assert_template "display"
        assert_equal "Playlist Sample Test has been saved", flash[:notice]
        assert_equal 0, session[:selectedlist].songs.size
        assert_equal 2, session[:music].size
        assert_equal "cavenator", PlayList.find_by_sql("select * from play_lists where playlist_title = 'Sample Test'")[0].username
        assert_equal 1, PlayList.find(:all).size
   end
end
