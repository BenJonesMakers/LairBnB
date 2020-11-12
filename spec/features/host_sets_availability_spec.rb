# As a host,
# So I can show when my space is available
# I want to be able to offer a range of dates
feature 'Host sets dates when adding the space' do
  scenario 'host sets start and end date' do
    visit_spaces_click_add()
    expect(current_path).to eq('/spaces/new')
    fill_in_name_and_dates()
    expect(current_path).to eq('/spaces')
    expect(page).to have_content '2020-01-01'
    # expect(page).to have_content '31/01/20'
  end
end
