require 'rails_helper'

feature 'restaurants' do
    context 'no restaurants have been added' do
        scenario 'should display a prompt to add a restuarant' do
            visit '/restaurants'
            expect(page).to have_content 'No restaurants yet'
            expect(page).to have_link 'Add a restaurant'
        end
    end

    before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
    end

    context 'restaurants have been added' do
        before do
            Restaurant.create(name: 'Nandos')
        end
        scenario 'display restaurants' do
            visit '/restaurants'
            expect(page).to have_content('Nandos')
            expect(page).not_to have_content('No restaurants yet!')
        end
    end

    context 'creating restaurants' do
        scenario 'prompts user to fill out a form, then displays the new restaurant' do
            visit '/restaurants'
            click_link 'Add a restaurant'
            fill_in 'Name', with: 'Nandos'
            click_button 'Create Restaurant'
            expect(page).to have_content 'Nandos'
            expect(current_path).to eq '/restaurants'
        end
        context 'an invalid restaurant' do
            scenario 'does not let you submit a name that is too short' do
                visit '/restaurants'
                click_link 'Add a restaurant'
                fill_in 'Name', with: 'kf'
                click_button 'Create Restaurant'
                expect(page).not_to have_css 'h2', text: 'kf'
                expect(page).to have_content 'error'
            end
        end
    end

    context 'viewing restaurants' do
        let!(:nandos) { Restaurant.create(name: 'Nandos') }
        scenario 'lets a user view a restaurant' do
            visit '/restaurants'
            click_link 'Nandos'
            expect(page).to have_content 'Nandos'
            expect(current_path).to eq "/restaurants/#{nandos.id}"
        end
    end

    context 'editing restaurants' do
        before { Restaurant.create name: 'Nandos', description: 'Greatest chicken this side of England', id: 1 }
        scenario 'let a user edit a restaurant' do
            visit '/restaurants'
            click_link 'Edit Nandos'
            fill_in 'Name', with: 'Nandos Chicken'
            fill_in 'Description', with: 'Greatest chicken in England'
            click_button 'Update Restaurant'
            click_link 'Nandos Chicken'
            expect(page).to have_content 'Nandos Chicken'
            expect(page).to have_content 'Greatest chicken in England'
            expect(current_path).to eq '/restaurants/1'
        end
    end

    context 'deleting restaurants' do
        before { Restaurant.create name: 'KFC', description: 'Deep fried goodness' }
        scenario 'removes a restaurant when a user clicks a delete link' do
            visit '/restaurants'
            click_link 'Delete KFC'
            expect(page).not_to have_content 'KFC'
            expect(page).to have_content 'Restaurant deleted successfully'
        end
    end
end

feature 'validation' do
    context 'A user must be logged in to create restuarant' do
        scenario 'should display an error is not signed in' do
            visit '/'
            click_link 'Add a restaurant'
            expect(page).to have_content 'You need to sign in or sign up before continuing.'
        end
    end
end
