require 'test_helper'

class FieldVisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @field_visit = field_visits(:one)
  end

  test "should get index" do
    get field_visits_url
    assert_response :success
  end

  test "should get new" do
    get new_field_visit_url
    assert_response :success
  end

  test "should create field_visit" do
    assert_difference('FieldVisit.count') do
      post field_visits_url, params: { field_visit: { name: @field_visit.name } }
    end

    assert_redirected_to field_visit_url(FieldVisit.last)
  end

  test "should show field_visit" do
    get field_visit_url(@field_visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_field_visit_url(@field_visit)
    assert_response :success
  end

  test "should update field_visit" do
    patch field_visit_url(@field_visit), params: { field_visit: { name: @field_visit.name } }
    assert_redirected_to field_visit_url(@field_visit)
  end

  test "should destroy field_visit" do
    assert_difference('FieldVisit.count', -1) do
      delete field_visit_url(@field_visit)
    end

    assert_redirected_to field_visits_url
  end
end
