feature 'adding a space' do
  scenario "user can add a space to the list" do
    visit_spaces_click_add()
    expect(current_path).to eq('/spaces/new')

    fill_in_name_desc_price()

    expect(current_path).to eq('/spaces')
    expect(page).to have_content("Deathstar")
    expect(page).to have_content("The description")
    expect(page).to have_content("10")
  end

end
