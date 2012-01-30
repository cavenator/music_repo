require 'test_helper'

class MusicPageControllerTest < ActionController::TestCase
  fixtures :musics
  
  def setup
  	music1 = musics(:song_one)
  	music2 = musics(:song_two)
  	music1.save
  	music2.save
  end
  
  test "index homepage" do
  	get :index
  	assert_response :success
  end
  
  test "display music page" do
  	get :display
  	assert_response :success
  	assert_template "display"
  end
  
  test "add song to selected list" do
  	get :add_previewed_music_to_list, :id => musics(:song_one).id
  	assert_redirected_to :action=>"display"
  	assert_equal "Mercy Me",musics(:song_one).title
  end
  
  test "view selected list" do
  	get :view_songs
  	assert_response :success
  	assert_template "view_songs"
  end
  
  test "empty music selection" do
  	get :empty_music_selection
  	assert_redirected_to :action => "display"
  	assert_equal "Music selection has been cleared", flash[:notice]
  end
  
  test "save playlist" do
  	@selected_list = SelectedList.new
  	@selected_list.add_songs_to_list(musics(:song_one))
  	get :save_playlist, {:playlist => {:username => "acave", :playlist_title => "Sample Test"}, :username=>"acave", :playlist_title => "Sample Test"}, :selectedlist => @selected_list
  	assert_redirected_to :action => "display"
  	assert_equal "Playlist Sample Test has been saved", flash[:notice]
  end
  
end
