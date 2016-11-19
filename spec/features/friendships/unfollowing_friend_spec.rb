require 'rails_helper'

RSpec.feature 'Unfollow a friend' do 
  before do 
    @user = Fabricate(:user)
    @friend = Fabricate(:user)
    @friendship = Fabricate(:friendship, user: @user, friend: @friend)
    login_as(@user)
  end

  scenario do 
    visit root_path

    click_link 'My Lounge'
    link = "a[href='/friendships/#{@friendship.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content("#{@friend.full_name} unfollowed")
  end
end 