require "test_helper"

class ForeignCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foreign_course = foreign_courses(:one)
  end

  test "should get index" do
    get foreign_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_foreign_course_url
    assert_response :success
  end

  test "should create foreign_course" do
    assert_difference('ForeignCourse.count') do
      post foreign_courses_url, params: { foreign_course: { credit_hours: @foreign_course.credit_hours, foreign_course_name: @foreign_course.foreign_course_name, instrutor: @foreign_course.instrutor, semester_approved: @foreign_course.semester_approved, tamu_department_id: @foreign_course.tamu_department_id, university_id: @foreign_course.university_id } }
    end

    assert_redirected_to foreign_course_url(ForeignCourse.last)
  end

  test "should show foreign_course" do
    get foreign_course_url(@foreign_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_foreign_course_url(@foreign_course)
    assert_response :success
  end

  test "should update foreign_course" do
    patch foreign_course_url(@foreign_course), params: { foreign_course: { credit_hours: @foreign_course.credit_hours, foreign_course_name: @foreign_course.foreign_course_name, instrutor: @foreign_course.instrutor, semester_approved: @foreign_course.semester_approved, tamu_department_id: @foreign_course.tamu_department_id, university_id: @foreign_course.university_id } }
    assert_redirected_to foreign_course_url(@foreign_course)
  end

  test "should destroy foreign_course" do
    assert_difference('ForeignCourse.count', -1) do
      delete foreign_course_url(@foreign_course)
    end

    assert_redirected_to foreign_courses_url
  end
end
