require 'rails_helper'

RSpec.feature 'User sign in' do 
  before do 
    @user = User.create!(email: 'test@email.com', password: 'password')
  end
  
  scenario 'with valid credentials' do 
    visit root_path

    click_link 'Sign in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end