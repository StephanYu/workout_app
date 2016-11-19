require 'rails_helper'

RSpec.feature 'Showing Friends Workout' do 
  before do 
    @user = Fabricate(:user)
    @friend = Fabricate(:user)
    @friendship = Fabricate(:friendship, user: @user, friend: @friend)
    login_as(@user)
  end

  scenario 'shows friends workout for last 7 days' do 
    visit root_path

    click_link 'My Lounge'
    click_link @friend.full_name

    expect(page).to have_content("#{@friend.full_name}'s Workout")
    expect(page).to have_content(@friend.exercises.sample.workout)
    expect(page).to have_css('div#chart')
  end
end