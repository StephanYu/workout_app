require 'rails_helper'

RSpec.feature 'Editing Exercises' do 
  before do 
    @user = User.create(email: 'test@email.com', password: 'password')
    @exercise = Exercise.create(duration_in_min: 50, workout: 'Test workout', workout_date: Date.today, user: @user)
    login_as(@user)
  end

  scenario 'successfully with valid data' do 
    visit root_path

    click_link 'My Lounge'

    path = "/users/#{@user.id}/exercises/#{@exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in 'Duration', with: 100
    click_button 'Update Exercise'

    expect(page).to have_content('Exercise successfully updated')
    expect(page).to have_content(100)
    expect(page).not_to have_content(50)
  end
end