# frozen_string_literal: true

require 'test_helper'

class TamuCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tamu_course = tamu_courses(:one)
  end

  test 'should get index' do
    get tamu_courses_url
    assert_response :success
  end

  test 'should get new' do
    get new_tamu_course_url
    assert_response :success
  end

  test 'should create tamu_course' do
    assert_difference('TamuCourse.count') do
      post tamu_courses_url,
           params: { tamu_course: { course_num: @tamu_course.course_num,
                                    tamu_department_id: @tamu_course.tamu_department_id } }
    end

    assert_redirected_to tamu_course_url(TamuCourse.last)
  end

  test 'should show tamu_course' do
    get tamu_course_url(@tamu_course)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tamu_course_url(@tamu_course)
    assert_response :success
  end

  test 'should update tamu_course' do
    patch tamu_course_url(@tamu_course),
          params: { tamu_course: { course_num: @tamu_course.course_num,
                                   tamu_department_id: @tamu_course.tamu_department_id } }
    assert_redirected_to tamu_course_url(@tamu_course)
  end

  test 'should destroy tamu_course' do
    assert_difference('TamuCourse.count', -1) do
      delete tamu_course_url(@tamu_course)
    end

    assert_redirected_to tamu_courses_url
  end
end
