# frozen_string_literal: true

require 'application_system_test_case'

class ForeignCourseTamuCoursesTest < ApplicationSystemTestCase
  setup do
    @foreign_courses_tamu_course = foreign_courses_tamu_courses(:one)
  end

  test "visiting the index" do
    visit foreign_courses_tamu_courses_url
    assert_selector "h1", text: "Foreign Course Tamu Courses"
  end

  test "creating a Foreign course tamu course" do
    visit foreign_courses_tamu_courses_url
    click_on "New Foreign Course Tamu Course"

    fill_in "Foreign course", with: @foreign_courses_tamu_course.foreign_course_id
    fill_in "Tamu course", with: @foreign_courses_tamu_course.tamu_course_id
    click_on "Create Foreign course tamu course"

    assert_text 'Foreign course tamu course was successfully created'
    click_on 'Back'
  end

  test "updating a Foreign course tamu course" do
    visit foreign_courses_tamu_courses_url
    click_on "Edit", match: :first

    fill_in "Foreign course", with: @foreign_courses_tamu_course.foreign_course_id
    fill_in "Tamu course", with: @foreign_courses_tamu_course.tamu_course_id
    click_on "Update Foreign course tamu course"

    assert_text 'Foreign course tamu course was successfully updated'
    click_on 'Back'
  end

  test "destroying a Foreign course tamu course" do
    visit foreign_courses_tamu_courses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Foreign course tamu course was successfully destroyed'
  end
end
