# As a user
# So I have somewhere to stay
# I want to be able to request a space from a host

feature 'show the calendar, select a date and then submit' do
  scenario 'picking an available date' do
    add_row_to_test_database()
    visit('/spaces')
    click_button('Pick')
    expect(page).to have_content "Pick a date"
    click_button('13')
    click_button('Request to Book')
    expect(page).to have_content "Requests"
  end
end
