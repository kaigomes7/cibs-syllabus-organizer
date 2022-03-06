# frozen_string_literal: true

require 'application_system_test_case'

class ForeignCoursesTest < ApplicationSystemTestCase
  setup do
    @foreign_course = foreign_courses(:one)
  end

  test 'visiting the index' do
    visit foreign_courses_url
    assert_selector 'h1', text: 'Foreign Courses'
  end

  test 'creating a Foreign course' do
    visit foreign_courses_url
    click_on 'New Foreign Course'

    fill_in 'Credit hours', with: @foreign_course.credit_hours
    fill_in 'Foreign course name', with: @foreign_course.foreign_course_name
    fill_in 'Instructor', with: @foreign_course.instructor
    fill_in 'Semester approved', with: @foreign_course.semester_approved
    fill_in 'Tamu department', with: @foreign_course.tamu_department_id
    fill_in 'University', with: @foreign_course.university_id
    click_on 'Create Foreign course'

    assert_text 'Foreign course was successfully created'
    click_on 'Back'
  end

  test 'updating a Foreign course' do
    visit foreign_courses_url
    click_on 'Edit', match: :first

    fill_in 'Credit hours', with: @foreign_course.credit_hours
    fill_in 'Foreign course name', with: @foreign_course.foreign_course_name
    fill_in 'Instructor', with: @foreign_course.instructor
    fill_in 'Semester approved', with: @foreign_course.semester_approved
    fill_in 'Tamu department', with: @foreign_course.tamu_department_id
    fill_in 'University', with: @foreign_course.university_id
    click_on 'Update Foreign course'

    assert_text 'Foreign course was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Foreign course' do
    visit foreign_courses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Foreign course was successfully destroyed'
  end
end
