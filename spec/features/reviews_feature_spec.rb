require 'rails_helper'

feature 'reviewing' do
  include CapybaraHelper

  before do
    sign_up
    add_restaurant
  end

  scenario 'allows users to leave a review using a form' do
    create_review
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('It was great!')
  end

  scenario 'allows user to delete a review' do
    create_review
    visit '/restaurants'
    click_link 'Nandos'
    expect(page).to have_content 'It was great!'
    expect(page).to have_content 'Delete review'
  end

  scenario 'deleting removes the review from the page' do
    create_review
    visit '/restaurants'
    click_link 'Nandos'
    expect(page).to have_content 'It was great!'
    expect(page).to have_content 'Delete review'
    click_link 'Delete review'
    visit '/restaurants'
    click_link 'Nandos'
    expect(page).not_to have_content 'It was great!'
  end
end
