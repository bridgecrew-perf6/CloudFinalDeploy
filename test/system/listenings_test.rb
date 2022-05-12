require "application_system_test_case"

class ListeningsTest < ApplicationSystemTestCase
  setup do
    @listening = listenings(:one)
  end

  test "visiting the index" do
    visit listenings_url
    assert_selector "h1", text: "Listenings"
  end

  test "should create listening" do
    visit listenings_url
    click_on "New listening"

    fill_in "Level", with: @listening.level
    fill_in "Title", with: @listening.title
    click_on "Create Listening"

    assert_text "Listening was successfully created"
    click_on "Back"
  end

  test "should update Listening" do
    visit listening_url(@listening)
    click_on "Edit this listening", match: :first

    fill_in "Level", with: @listening.level
    fill_in "Title", with: @listening.title
    click_on "Update Listening"

    assert_text "Listening was successfully updated"
    click_on "Back"
  end

  test "should destroy Listening" do
    visit listening_url(@listening)
    click_on "Destroy this listening", match: :first

    assert_text "Listening was successfully destroyed"
  end
end
