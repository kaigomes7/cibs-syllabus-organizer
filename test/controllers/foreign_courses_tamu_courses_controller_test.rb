require "test_helper"

class ForeignCoursesTamuCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foreign_courses_tamu_course = foreign_courses_tamu_courses(:one)
  end

  test "should get index" do
    get foreign_courses_tamu_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_foreign_courses_tamu_course_url
    assert_response :success
  end

  test "should create foreign_courses_tamu_course" do
    assert_difference('ForeignCoursesTamuCourse.count') do
      post foreign_courses_tamu_courses_url, params: { foreign_courses_tamu_course: { foreign_course_id: @foreign_courses_tamu_course.foreign_course_id, tamu_course_id: @foreign_courses_tamu_course.tamu_course_id } }
    end

    assert_redirected_to foreign_courses_tamu_course_url(ForeignCoursesTamuCourse.last)
  end

  test "should show foreign_courses_tamu_course" do
    get foreign_courses_tamu_course_url(@foreign_courses_tamu_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_foreign_courses_tamu_course_url(@foreign_courses_tamu_course)
    assert_response :success
  end

  test "should update foreign_courses_tamu_course" do
    patch foreign_courses_tamu_course_url(@foreign_courses_tamu_course), params: { foreign_courses_tamu_course: { foreign_course_id: @foreign_courses_tamu_course.foreign_course_id, tamu_course_id: @foreign_courses_tamu_course.tamu_course_id } }
    assert_redirected_to foreign_courses_tamu_course_url(@foreign_courses_tamu_course)
  end

  test "should destroy foreign_courses_tamu_course" do
    assert_difference('ForeignCoursesTamuCourse.count', -1) do
      delete foreign_courses_tamu_course_url(@foreign_courses_tamu_course)
    end

    assert_redirected_to foreign_courses_tamu_courses_url
  end
end
