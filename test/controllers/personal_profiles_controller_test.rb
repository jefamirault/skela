require 'test_helper'

class PersonalProfilesControllerTest < ActionController::TestCase
  setup do
    @personal_profile = personal_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_profile" do
    assert_difference('PersonalProfile.count') do
      post :create, personal_profile: { favorite_color_id: @personal_profile.favorite_color_id, name: @personal_profile.name }
    end

    assert_redirected_to personal_profile_path(assigns(:personal_profile))
  end

  test "should show personal_profile" do
    get :show, id: @personal_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_profile
    assert_response :success
  end

  test "should update personal_profile" do
    patch :update, id: @personal_profile, personal_profile: { favorite_color_id: @personal_profile.favorite_color_id, name: @personal_profile.name }
    assert_redirected_to personal_profile_path(assigns(:personal_profile))
  end

  test "should destroy personal_profile" do
    assert_difference('PersonalProfile.count', -1) do
      delete :destroy, id: @personal_profile
    end

    assert_redirected_to personal_profiles_path
  end
end
