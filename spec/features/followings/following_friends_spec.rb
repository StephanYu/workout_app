require 'rails_helper'

RSpec.feature 'Following friends' do 
  before do 
    @user_1 = Fabricate(:user)
    @user_2 = Fabricate(:user)

    login_as(@user_1)
  end

  scenario 'when signed in' do 
    visit root_path

    expect(page).to have_content(@user_1.full_name)
    expect(page).to have_content(@user_2.full_name)

    href_1 = "friendships?friend_id=#{@user_1.id}"
    expect(page).not_to have_link('Follow', href: href_1)

    link = "a[href='/friendships?friend_id=#{@user_2.id}']" 
    find(link).click

    href_2 = "friendships?friend_id=#{@user_2.id}"
    expect(page).not_to have_link('Follow', href: href_2)
  end
end