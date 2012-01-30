require 'test_helper'

class PlayListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_list" do
    assert_difference('PlayList.count') do
      post :create, :play_list => {:username => "Cavenator", :playlist_title => "Unit Test"}
    end

    assert_redirected_to play_list_path(assigns(:play_list))
  end

  test "should show play_list" do
    get :show, :id => play_lists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => play_lists(:one).to_param
    assert_response :success
  end

  test "should update play_list" do
    put :update, :id => play_lists(:one).to_param, :play_list => { }
    assert_redirected_to play_list_path(assigns(:play_list))
  end

  test "should destroy play_list" do
    assert_difference('PlayList.count', -1) do
      delete :destroy, :id => play_lists(:one).to_param
    end

    assert_redirected_to play_lists_path
  end
end
