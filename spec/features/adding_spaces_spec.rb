feature 'adding a space' do
  scenario "user can add a space to the list" do
    visit('/spaces')
    click_button "Add Space"
    expect(current_path).to eq('/spaces/new')

    fill_in('name', with: "Deathstar")
    click_button "submit"

    expect(current_path).to eq('/spaces')
    expect(page).to have_content("Deathstar")

  end
end
