require 'rails_helper'

RSpec.feature 'Listing Exercises' do 
  before do 
    @user = Fabricate(:user)
    login_as(@user)
    @outdated_exercise = Fabricate(:exercise, workout_date: 9.days.ago, user: @user)
  end

  scenario 'shows users workouts for the past 7 days' do 
    visit root_path

    click_link 'My Lounge'

    expect(page).to have_content(@user.exercises.first.duration_in_min)
    expect(page).to have_content(@user.exercises.first.workout)
    expect(page).to have_content(@user.exercises.first.workout_date)

    expect(page).to have_content(@user.exercises.last.duration_in_min)
    expect(page).to have_content(@user.exercises.last.workout)
    expect(page).to have_content(@user.exercises.last.workout_date)

    expect(page).not_to have_content(@outdated_exercise.duration_in_min)
    expect(page).not_to have_content(@outdated_exercise.workout)
    expect(page).not_to have_content(@outdated_exercise.workout_date)
  end

  scenario 'displays no workout message if none exist' do 
    @user.exercises.delete_all

    visit root_path
    click_link 'My Lounge'

    expect(page).to have_content('No Workouts Yet')
  end
end