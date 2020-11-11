feature 'adding a space' do
  scenario "user can add a space to the list" do
    visit('/spaces')
    click_button "Add Space"
    expect(current_path).to eq('/spaces/new')

    fill_in('name', with: "Deathstar")
    fill_in('description', with: "The description")
    fill_in('price', with: "10")
    click_button "submit"

    expect(current_path).to eq('/spaces')
    expect(page).to have_content("Deathstar")
    expect(page).to have_content("The description")
    expect(page).to have_content("10")
  end

end
