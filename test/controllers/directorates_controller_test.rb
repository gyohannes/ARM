require 'test_helper'

class DirectoratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @directorate = directorates(:one)
  end

  test "should get index" do
    get directorates_url
    assert_response :success
  end

  test "should get new" do
    get new_directorate_url
    assert_response :success
  end

  test "should create directorate" do
    assert_difference('Directorate.count') do
      post directorates_url, params: { directorate: { description: @directorate.description, name: @directorate.name } }
    end

    assert_redirected_to directorate_url(Directorate.last)
  end

  test "should show directorate" do
    get directorate_url(@directorate)
    assert_response :success
  end

  test "should get edit" do
    get edit_directorate_url(@directorate)
    assert_response :success
  end

  test "should update directorate" do
    patch directorate_url(@directorate), params: { directorate: { description: @directorate.description, name: @directorate.name } }
    assert_redirected_to directorate_url(@directorate)
  end

  test "should destroy directorate" do
    assert_difference('Directorate.count', -1) do
      delete directorate_url(@directorate)
    end

    assert_redirected_to directorates_url
  end
end
