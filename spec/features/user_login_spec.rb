feature 'log in to LairBnB' do
  scenario 'logs in to an pre-existing account' do
    add_row_to_test_database()
    visit('login')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: 'password')
    click_button('Login')
    expect(current_path).to eq '/homepage'
  end
# ONLY ONE WORKS AT A TIME

  scenario "unsuccessful log-in due to wrong username" do
    visit('login')
    fill_in('email', with: 'wrong@email.com')
    fill_in('password', with: 'password')
    click_button('Login')
    expect(current_path).to eq '/login'
  end

  scenario "unsuccessful log-in due to wrong password" do
    visit('login')
    fill_in('email', with: 'email@email.com')
    fill_in('password', with: 'wrong')
    click_button('Login')
    expect(current_path).to eq '/login'
  end
end
