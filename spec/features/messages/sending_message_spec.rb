require 'rails_helper'

RSpec.feature 'Sending chat message' do 
  before do 
    @user = Fabricate(:user)
    @friend_1 = Fabricate(:user)
    @friend_2 = Fabricate(:user)
    @chatroom_name = @user.room.name
    Fabricate(:friendship, user: @friend_1, friend: @user)
    Fabricate(:friendship, user: @friend_2, friend: @user)
    login_as(@user)
  end


  scenario 'shows in chat window' do 
    visit root_path

    click_link 'My Lounge'

    expect(page).to have_content(@chatroom_name)

    fill_in 'message-field', with: 'Hello'
    click_button 'Post'

    expect(page).to have_content('Hello')

    within('#followers') do 
      expect(page).to have_link(@friend_1.full_name)
      expect(page).to have_link(@friend_2.full_name)
    end
  end
end