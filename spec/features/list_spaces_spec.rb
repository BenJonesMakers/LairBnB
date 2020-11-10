feature 'list of spaces' do
  scenario "user can see a list of spaces" do
    visit('/spaces')

    expect(page).to have_content("Deathstar")
    # expect(page).to have_content("Moonraker")
    # expect(page).to have_content("Ice hotel")
  end
end
