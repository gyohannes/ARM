require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "creating a Participant" do
    visit participants_url
    click_on "New Participant"

    fill_in "Checked In", with: @participant.checked_in
    fill_in "Directorate", with: @participant.directorate_id
    fill_in "Email", with: @participant.email
    fill_in "Event", with: @participant.event_id
    fill_in "Field Visit", with: @participant.field_visit
    fill_in "Group", with: @participant.group_id
    fill_in "Name", with: @participant.name
    fill_in "Organization Name", with: @participant.organization_name
    fill_in "Organization Type", with: @participant.organization_type_id
    fill_in "Participant Type", with: @participant.participant_type_id
    fill_in "Place Of Work", with: @participant.place_of_work
    fill_in "Responsibility", with: @participant.responsibility
    fill_in "Stay At", with: @participant.stay_at
    fill_in "Telephone Number", with: @participant.telephone_number
    fill_in "Title", with: @participant.title
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "updating a Participant" do
    visit participants_url
    click_on "Edit", match: :first

    fill_in "Checked In", with: @participant.checked_in
    fill_in "Directorate", with: @participant.directorate_id
    fill_in "Email", with: @participant.email
    fill_in "Event", with: @participant.event_id
    fill_in "Field Visit", with: @participant.field_visit
    fill_in "Group", with: @participant.group_id
    fill_in "Name", with: @participant.name
    fill_in "Organization Name", with: @participant.organization_name
    fill_in "Organization Type", with: @participant.organization_type_id
    fill_in "Participant Type", with: @participant.participant_type_id
    fill_in "Place Of Work", with: @participant.place_of_work
    fill_in "Responsibility", with: @participant.responsibility
    fill_in "Stay At", with: @participant.stay_at
    fill_in "Telephone Number", with: @participant.telephone_number
    fill_in "Title", with: @participant.title
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant" do
    visit participants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant was successfully destroyed"
  end
end
