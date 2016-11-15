require 'rails_helper'

RSpec.feature 'Deleting Exercises' do 
  before do 
    @user = User.create(email: 'test@email.com', password: 'password')
    @exercise = Exercise.create(duration_in_min: 50, workout: 'Test workout', workout_date: Date.today, user: @user)
    login_as(@user)
  end

  scenario do 
    visit root_path

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@exercise.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"
    
    find(:xpath, link).click
    
    expect(page).to have_content('Exercise has been deleted')
  end
end