feature 'log out' do
  scenario 'logs out of account' do
    visit('logout')
    click_button('Logout')
    expect(current_path).to eq '/user/new'
  end

  scenario 'logs out of account from homepage' do
    visit('homepage')
    click_button('Logout')
    expect(current_path).to eq '/user/new'
  end
end
