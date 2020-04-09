require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post participants_url, params: { participant: { checked_in: @participant.checked_in, directorate_id: @participant.directorate_id, email: @participant.email, event_id: @participant.event_id, field_visit: @participant.field_visit, group_id: @participant.group_id, name: @participant.name, organization_name: @participant.organization_name, organization_type_id: @participant.organization_type_id, participant_type_id: @participant.participant_type_id, place_of_work: @participant.place_of_work, responsibility: @participant.responsibility, stay_at: @participant.stay_at, telephone_number: @participant.telephone_number, title: @participant.title } }
    end

    assert_redirected_to participant_url(Participant.last)
  end

  test "should show participant" do
    get participant_url(@participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant)
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { checked_in: @participant.checked_in, directorate_id: @participant.directorate_id, email: @participant.email, event_id: @participant.event_id, field_visit: @participant.field_visit, group_id: @participant.group_id, name: @participant.name, organization_name: @participant.organization_name, organization_type_id: @participant.organization_type_id, participant_type_id: @participant.participant_type_id, place_of_work: @participant.place_of_work, responsibility: @participant.responsibility, stay_at: @participant.stay_at, telephone_number: @participant.telephone_number, title: @participant.title } }
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete participant_url(@participant)
    end

    assert_redirected_to participants_url
  end
end
