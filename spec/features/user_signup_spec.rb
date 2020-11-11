feature 'sign up to LairBnB' do
  scenario 'allows a user to sign up' do
    visit ('/user/new')

    fill_in('email', with: 'email')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign up')

    expect(current_path).to eq('/homepage')
  end

  scenario 'failed sign up' do
    visit ('/user/new')

    fill_in('email', with: 'email')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'error')
    click_button('Sign up')

    expect(current_path).to eq('/user/new')
  end
end
