require 'rails_helper'

RSpec.feature 'Visit Homepage' do 
  scenario 'user views homepage' do 
    visit root_path

    expect(page).to have_link('Home')
    expect(page).to have_link('Athlete\'s Den')
    expect(page).to have_content('Workout App')
    expect(page).to have_content('some text about fitness')
  end
end