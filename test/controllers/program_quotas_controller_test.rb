require 'test_helper'

class ProgramQuotasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_quota = program_quotas(:one)
  end

  test "should get index" do
    get program_quotas_url
    assert_response :success
  end

  test "should get new" do
    get new_program_quota_url
    assert_response :success
  end

  test "should create program_quota" do
    assert_difference('ProgramQuota.count') do
      post program_quotas_url, params: { program_quota: { academic_year_id: @program_quota.academic_year_id, program_id: @program_quota.program_id, quota: @program_quota.quota, university_id: @program_quota.university_id } }
    end

    assert_redirected_to program_quota_url(ProgramQuota.last)
  end

  test "should show program_quota" do
    get program_quota_url(@program_quota)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_quota_url(@program_quota)
    assert_response :success
  end

  test "should update program_quota" do
    patch program_quota_url(@program_quota), params: { program_quota: { academic_year_id: @program_quota.academic_year_id, program_id: @program_quota.program_id, quota: @program_quota.quota, university_id: @program_quota.university_id } }
    assert_redirected_to program_quota_url(@program_quota)
  end

  test "should destroy program_quota" do
    assert_difference('ProgramQuota.count', -1) do
      delete program_quota_url(@program_quota)
    end

    assert_redirected_to program_quotas_url
  end
end
