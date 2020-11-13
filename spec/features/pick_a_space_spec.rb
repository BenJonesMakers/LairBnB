# As a user
# So I have somewhere to stay
# I want to be able to request a space from a host

feature 'pick a space from the list' do
  scenario 'when list is displayed - pick the first one' do
    add_row_to_test_database()
    visit('/spaces')
    click_button('Pick')
    expect(page).to have_content "Pick a date"
  end

  scenario 'user picks a date on the calendar and clicks request a date button' do
    add_row_to_test_database()
    visit('/spaces')
    click_button('Pick')
    expect(current_path).to eq('/spaces/pick_a_date')

    click_link("01")
    click_button('request to book')
    expect(page).to have_content('Requests')
  end
end
