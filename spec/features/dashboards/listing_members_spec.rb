require 'rails_helper'

RSpec.feature 'Listing Members' do 
  before do 
    @adam = User.create(first_name: 'Adam', last_name: 'Test', email: 'adam@email.com', password: 'password')
    @eve = User.create(first_name: 'Eve', last_name: 'Test', email: 'eve@email.com', password: 'password')
  end

  scenario 'shows a list of registered members' do 
    visit root_path

    expect(page).to have_content('List of Members')
    expect(page).to have_content(@adam.full_name)
    expect(page).to have_content(@eve.full_name)
  end
end