require 'rails_helper'

RSpec.feature 'User signs up' do 
  scenario 'Sign up is successfull' do 
    visit root_path

    click_link 'Sign up'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Create Account'

    expect(page).to have_content('You have signed up successfully')
    expect(current_path).to eq()
  end

  scenario 'Sign up is unsuccessful' do 

  end
end