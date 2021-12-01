require "application_system_test_case"

class ModuleLeadersTest < ApplicationSystemTestCase
  setup do
    @module_leader = module_leaders(:one)
  end

  test "visiting the index" do
    visit module_leaders_url
    assert_selector "h1", text: "Module Leaders"
  end

  test "creating a Module leader" do
    visit module_leaders_url
    click_on "New Module Leader"

    fill_in "Department", with: @module_leader.department
    fill_in "Firstname", with: @module_leader.firstName
    fill_in "Lastname", with: @module_leader.lastName
    fill_in "Office", with: @module_leader.office
    fill_in "Officehours", with: @module_leader.officeHours
    click_on "Create Module leader"

    assert_text "Module leader was successfully created"
    click_on "Back"
  end

  test "updating a Module leader" do
    visit module_leaders_url
    click_on "Edit", match: :first

    fill_in "Department", with: @module_leader.department
    fill_in "Firstname", with: @module_leader.firstName
    fill_in "Lastname", with: @module_leader.lastName
    fill_in "Office", with: @module_leader.office
    fill_in "Officehours", with: @module_leader.officeHours
    click_on "Update Module leader"

    assert_text "Module leader was successfully updated"
    click_on "Back"
  end

  test "destroying a Module leader" do
    visit module_leaders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Module leader was successfully destroyed"
  end
end
