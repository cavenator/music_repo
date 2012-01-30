require 'test_helper'

class SelectedListTest < ActiveSupport::TestCase
   fixtures :musics

   def setup
      	@selected_songs = SelectedList.new
         @song1 = musics(:song_one)
   	@song2 = musics(:song_two)
   end
   
   test "add two distinct items" do
   	@selected_songs.add_songs_to_list @song1
   	@selected_songs.add_songs_to_list @song2
   	assert_equal 2, @selected_songs.songs.size
   end
   
   test "add two of the same items" do
   	@selected_songs.add_songs_to_list @song1
   	@selected_songs.add_songs_to_list @song1
   	assert_equal 1, @selected_songs.songs.size
   end

end