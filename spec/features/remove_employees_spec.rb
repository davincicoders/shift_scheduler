require 'rails_helper'

feature 'Removing employees' do
  scenario 'should allow a user to remove an employee' do
    employee = FactoryGirl.create(:employee)

    visit '/employees'

    click_link 'Remove'

    expect(page).to have_content(
      "#{employee.first_name} #{employee.last_name} was removed"
    )

    within '#employee_table' do
      expect(page).to have_content(employee.first_name)
      expect(page).to have_content(employee.last_name)
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.employee_number)
      expect(page).to have_content(employee.hire_date)
      expect(page).to have_content(employee.removal_date)
    end
  end
end