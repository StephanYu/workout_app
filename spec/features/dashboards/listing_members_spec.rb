require 'rails_helper'

RSpec.feature 'Listing Members' do 
  before do 
    @user = Fabricate(:user)
    @friend = Fabricate(:user)
  end

  scenario 'shows a list of registered members' do 
    visit root_path

    expect(page).to have_content('List of Members')
    expect(page).to have_content(@user.full_name)
    expect(page).to have_content(@friend.full_name)
  end
end