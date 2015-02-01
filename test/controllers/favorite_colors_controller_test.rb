require 'test_helper'

class FavoriteColorsControllerTest < ActionController::TestCase
  setup do
    @favorite_color = favorite_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_color" do
    assert_difference('FavoriteColor.count') do
      post :create, favorite_color: {  }
    end

    assert_redirected_to favorite_color_path(assigns(:favorite_color))
  end

  test "should show favorite_color" do
    get :show, id: @favorite_color
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_color
    assert_response :success
  end

  test "should update favorite_color" do
    patch :update, id: @favorite_color, favorite_color: {  }
    assert_redirected_to favorite_color_path(assigns(:favorite_color))
  end

  test "should destroy favorite_color" do
    assert_difference('FavoriteColor.count', -1) do
      delete :destroy, id: @favorite_color
    end

    assert_redirected_to favorite_colors_path
  end
end
