# frozen_string_literal: true

require 'application_system_test_case'

class TamuCoursesTest < ApplicationSystemTestCase
  setup do
    @tamu_course = tamu_courses(:one)
  end

  test 'visiting the index' do
    visit tamu_courses_url
    assert_selector 'h1', text: 'Tamu Courses'
  end

  test 'creating a Tamu course' do
    visit tamu_courses_url
    click_on 'New Tamu Course'

    fill_in 'Course num', with: @tamu_course.course_num
    fill_in 'Tamu department', with: @tamu_course.tamu_department_id
    click_on 'Create Tamu course'

    assert_text 'Tamu course was successfully created'
    click_on 'Back'
  end

  test 'updating a Tamu course' do
    visit tamu_courses_url
    click_on 'Edit', match: :first

    fill_in 'Course num', with: @tamu_course.course_num
    fill_in 'Tamu department', with: @tamu_course.tamu_department_id
    click_on 'Update Tamu course'

    assert_text 'Tamu course was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Tamu course' do
    visit tamu_courses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Tamu course was successfully destroyed'
  end
end
