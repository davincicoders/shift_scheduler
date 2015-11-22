require 'rails_helper'

feature 'Organization Authentication' do
  scenario 'allows a company to signup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link('Signup')

    fill_in 'Name', with: 'TiredDevs'
    fill_in 'Address', with: '1234 Left Hand Dr.'
    fill_in 'City', with: 'Boulder'
    fill_in 'State', with: 'CO'
    fill_in 'Zip Code', with: '80303'
    fill_in 'Phone Number', with: '1234567980'
    fill_in 'Email', with: 'admin@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'

    click_button('Signup')

    expect(page).to have_text("Thank you for signing up!")
    expect(page).to have_text("Signed into TiredDevs as admin@test.com")
  end

  scenario 'allows existing organizations to log in' do
    organization = FactoryGirl.create(:organization)

    visit '/'

    expect(page).to have_link('Login')

    click_link 'Login'

    fill_in 'Email', with: organization.email
    fill_in 'Password', with: organization.password

    click_button 'Login'

    expect(page).to have_content("Welcome back #{organization.email}")
    expect(page).to have_text("Signed into #{organization.name} as #{organization.email}")
  end

  scenario 'does not allow existing organizations to login with an invalid password' do
    organization = FactoryGirl.create(:organization, password: 'password')

    visit '/'

    expect(page).to have_link('Login')

    click_link 'Login'

    fill_in 'Email', with: organization.email
    fill_in 'Password', with: 'invalidpassword'

    click_button 'Login'

    expect(page).to have_content('Invalid email or password')
  end
end