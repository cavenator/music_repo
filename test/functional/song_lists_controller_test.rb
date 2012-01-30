require 'test_helper'

class SongListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_list" do
    assert_difference('SongList.count') do
      post :create, :song_list => {:play_list_id => 1, :music_id => 3 }
    end

    assert_redirected_to song_list_path(assigns(:song_list))
  end

  test "should show song_list" do
    get :show, :id => song_lists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => song_lists(:one).to_param
    assert_response :success
  end

  test "should update song_list" do
    put :update, :id => song_lists(:one).to_param, :song_list => {}
    assert_redirected_to song_list_path(assigns(:song_list))
  end

  test "should destroy song_list" do
    assert_difference('SongList.count', -1) do
      delete :destroy, :id => song_lists(:one).to_param
    end

    assert_redirected_to song_lists_path
  end
end
