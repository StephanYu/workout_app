require 'rails_helper'

RSpec.feature 'Visit Homepage' do 
  scenario 'user views index page' do 
    visit root_path

    expect(page).to have_link('Home')
    expect(page).to have_link('Athletes Den')
    expect(page).to have_content('Workout App')
    expect(page).to have_content('Show off your workout')
  end
end