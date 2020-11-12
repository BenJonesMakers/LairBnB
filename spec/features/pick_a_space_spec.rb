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
end
