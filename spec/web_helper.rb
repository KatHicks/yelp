module CapybaraHelper
  def sign_up
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_in
  end

  def add_restaurant
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'Nandos'
    click_button 'Create Restaurant'
    expect(page).to have_content 'Nandos'
    expect(current_path).to eq '/restaurants'
  end

  def create_review
    visit '/restaurants'
    click_link 'Review Nandos'
    fill_in "Thoughts", with: "It was great!"
    select '5', from: 'Rating'
    click_button 'Leave Review'
  end
end
