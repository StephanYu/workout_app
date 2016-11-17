require 'rails_helper'

RSpec.feature 'User signs up' do 
  scenario 'with valid credentials' do 
    visit root_path

    click_link 'Sign up'
    fill_in 'First name', with: 'Adam'
    fill_in 'Last name', with: 'Test'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')

    visit root_path
    expect(page).to have_content('Adam Test')
  end  
end