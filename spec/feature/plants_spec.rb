require 'rails_helper'

feature 'Plants' do
  scenario 'User can CRUD plants' do
    visit plants_path
    click_on 'New Plant'
    fill_in 'Common name', with: 'Nettles'
    fill_in 'Genus species', with: 'Urtica diotica'
    click_on 'Create'
    expect(current_path).to eq(plants_path)
    expect(page).to have_content('Nettles')
    expect(page).to have_content('Urtica diotica')
    click_on 'Nettles'
    expect(current_path).to eq(plant_path(Plant.find_by(common_name: 'Nettles')))
    expect(page).to have_content('Nettles')
    expect(page).to have_content('Urtica diotica')
    click_on 'Edit'
    fill_in 'Common name', with: 'Stinging Nettle'
    click_on 'Update'
    expect(current_path).to eq(plant_path(Plant.find_by(common_name: 'Stinging Nettle')))
    expect(page).to_not have_content('Nettles')
    expect(page).to have_content('Stinging Nettle')
    click_on 'Delete'
    expect(page).to_not have_content('Stinging Nettle')
  end
end
