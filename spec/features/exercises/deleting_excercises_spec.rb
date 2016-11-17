require 'rails_helper'

RSpec.feature 'Deleting Exercises' do 
  before do 
    @user = Fabricate(:user)
    login_as(@user)
  end

  scenario do 
    visit root_path

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@user.exercises.first.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"
    
    find(:xpath, link).click
    
    expect(page).to have_content('Exercise has been deleted')
  end
end