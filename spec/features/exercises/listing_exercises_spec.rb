require 'rails_helper'

RSpec.feature 'Listing Exercises' do 
  before do 
    @user = User.create!(email: 'test@email.com', password: 'password')
    login_as(@user)
    @exercise_1 = Exercise.create(duration_in_min: 20, workout: 'Crossfit WOD', workout_date: Date.today, user: @user)
    @exercise_2 = Exercise.create(duration_in_min: 10, workout: 'Freeletics WOD', workout_date: 2.days.ago, user: @user)
  end
  scenario 'shows users workouts for the past 7 days' do 
    visit root_path

    click_link 'My Lounge'

    expect(page).to have_content(@exercise_1.duration_in_min)
    expect(page).to have_content(@exercise_1.workout)
    expect(page).to have_content(@exercise_1.workout_date)

    expect(page).to have_content(@exercise_2.duration_in_min)
    expect(page).to have_content(@exercise_2.workout)
    expect(page).to have_content(@exercise_2.workout_date)
  end
end