require 'rails_helper'

RSpec.feature 'User signs out' do 
  before do 
    @user = Fabricate(:user)
    login_as(@user)
  end

  scenario do 
    visit root_path
    click_link 'Sign out'

    expect(page).to have_content("Signed out successfully")
  end
end