# frozen_string_literal: true

require 'application_system_test_case'

class TamuDepartmentsTest < ApplicationSystemTestCase
  setup do
    @tamu_department = tamu_departments(:one)
  end

  test 'visiting the index' do
    visit tamu_departments_url
    assert_selector 'h1', text: 'Tamu Departments'
  end

  test 'creating a Tamu department' do
    visit tamu_departments_url
    click_on 'New Tamu Department'

    fill_in 'Tamu department name', with: @tamu_department.tamu_department_name
    click_on 'Create Tamu department'

    assert_text 'Tamu department was successfully created'
    click_on 'Back'
  end

  test 'updating a Tamu department' do
    visit tamu_departments_url
    click_on 'Edit', match: :first

    fill_in 'Tamu department name', with: @tamu_department.tamu_department_name
    click_on 'Update Tamu department'

    assert_text 'Tamu department was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Tamu department' do
    visit tamu_departments_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Tamu department was successfully destroyed'
  end
end
