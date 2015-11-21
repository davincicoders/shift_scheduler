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

    # And I click 'Logout'
    #
    # And I should see 'Bob Smith has successfully logged out'
    #
    # And I click 'Login'
    #
    # And I fill in email with bob@smith.com
    # And I fill in Password with password
    #
    # I should see 'Welcome back Bob Smith'
  end
end