require 'rails_helper'

RSpec.feature 'Searching for Users' do 
  before do 
    @user_1 = Fabricate(:user, last_name: 'Doe')
    @user_2 = Fabricate(:user, last_name: 'Doe')
  end

  scenario 'with existing name returns all users' do 

    visit root_path

    fill_in 'search_name', with: 'Doe'
    click_button 'Search'

    expect(page).to have_content(@user_1.full_name)
    expect(page).to have_content(@user_2.full_name)
    expect(current_path).to eq('/dashboards/search')
  end
end