# frozen_string_literal: true

require 'application_system_test_case'

class ForeignCoursesStudentsTest < ApplicationSystemTestCase
  setup do
    @foreign_courses_student = foreign_courses_students(:one)
  end

  test "visiting the index" do
    visit foreign_courses_students_url
    assert_selector "h1", text: "Foreign courses Students"
  end

  test "creating a Courses student" do
    visit foreign_courses_students_url
    click_on "New Courses Student"

    fill_in "Foreign course", with: @foreign_courses_student.foreign_course_id
    fill_in "Student", with: @foreign_courses_student.student_id
    click_on "Create Courses student"

    assert_text 'Courses student was successfully created'
    click_on 'Back'
  end

  test "updating a Courses student" do
    visit foreign_courses_students_url
    click_on "Edit", match: :first

    fill_in "Foreign course", with: @foreign_courses_student.foreign_course_id
    fill_in "Student", with: @foreign_courses_student.student_id
    click_on "Update Courses student"

    assert_text 'Courses student was successfully updated'
    click_on 'Back'
  end

  test "destroying a Courses student" do
    visit foreign_courses_students_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Courses student was successfully destroyed'
  end
end
