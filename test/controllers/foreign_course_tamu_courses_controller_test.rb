require "test_helper"

class ForeignCourseTamuCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foreign_course_tamu_course = foreign_course_tamu_courses(:one)
  end

  test "should get index" do
    get foreign_course_tamu_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_foreign_course_tamu_course_url
    assert_response :success
  end

  test "should create foreign_course_tamu_course" do
    assert_difference('ForeignCourseTamuCourse.count') do
      post foreign_course_tamu_courses_url, params: { foreign_course_tamu_course: { foreign_course_id: @foreign_course_tamu_course.foreign_course_id, tamu_course_id: @foreign_course_tamu_course.tamu_course_id } }
    end

    assert_redirected_to foreign_course_tamu_course_url(ForeignCourseTamuCourse.last)
  end

  test "should show foreign_course_tamu_course" do
    get foreign_course_tamu_course_url(@foreign_course_tamu_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_foreign_course_tamu_course_url(@foreign_course_tamu_course)
    assert_response :success
  end

  test "should update foreign_course_tamu_course" do
    patch foreign_course_tamu_course_url(@foreign_course_tamu_course), params: { foreign_course_tamu_course: { foreign_course_id: @foreign_course_tamu_course.foreign_course_id, tamu_course_id: @foreign_course_tamu_course.tamu_course_id } }
    assert_redirected_to foreign_course_tamu_course_url(@foreign_course_tamu_course)
  end

  test "should destroy foreign_course_tamu_course" do
    assert_difference('ForeignCourseTamuCourse.count', -1) do
      delete foreign_course_tamu_course_url(@foreign_course_tamu_course)
    end

    assert_redirected_to foreign_course_tamu_courses_url
  end
end
