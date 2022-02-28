require "test_helper"

class CoursesStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courses_student = courses_students(:one)
  end

  test "should get index" do
    get courses_students_url
    assert_response :success
  end

  test "should get new" do
    get new_courses_student_url
    assert_response :success
  end

  test "should create courses_student" do
    assert_difference('CoursesStudent.count') do
      post courses_students_url, params: { courses_student: { foreign_course_id: @courses_student.foreign_course_id, student_id: @courses_student.student_id } }
    end

    assert_redirected_to courses_student_url(CoursesStudent.last)
  end

  test "should show courses_student" do
    get courses_student_url(@courses_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_courses_student_url(@courses_student)
    assert_response :success
  end

  test "should update courses_student" do
    patch courses_student_url(@courses_student), params: { courses_student: { foreign_course_id: @courses_student.foreign_course_id, student_id: @courses_student.student_id } }
    assert_redirected_to courses_student_url(@courses_student)
  end

  test "should destroy courses_student" do
    assert_difference('CoursesStudent.count', -1) do
      delete courses_student_url(@courses_student)
    end

    assert_redirected_to courses_students_url
  end
end
