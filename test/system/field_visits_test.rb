require "application_system_test_case"

class FieldVisitsTest < ApplicationSystemTestCase
  setup do
    @field_visit = field_visits(:one)
  end

  test "visiting the index" do
    visit field_visits_url
    assert_selector "h1", text: "Field Visits"
  end

  test "creating a Field visit" do
    visit field_visits_url
    click_on "New Field Visit"

    fill_in "Name", with: @field_visit.name
    click_on "Create Field visit"

    assert_text "Field visit was successfully created"
    click_on "Back"
  end

  test "updating a Field visit" do
    visit field_visits_url
    click_on "Edit", match: :first

    fill_in "Name", with: @field_visit.name
    click_on "Update Field visit"

    assert_text "Field visit was successfully updated"
    click_on "Back"
  end

  test "destroying a Field visit" do
    visit field_visits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Field visit was successfully destroyed"
  end
end
