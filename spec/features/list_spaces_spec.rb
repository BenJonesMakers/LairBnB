feature 'list of spaces' do
  scenario "user can see a list of spaces" do

    add_row_to_test_database()
    visit('/spaces')
    expect(page).to have_content("Deathstar")
    expect(page).to have_content("The description")
    expect(page).to have_content("10")
  end
end
