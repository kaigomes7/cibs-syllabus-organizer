require "test_helper"

class ForeignCoursesStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foreign_courses_student = foreign_courses_students(:one)
  end

  test "should get index" do
    get foreign_courses_students_url
    assert_response :success
  end

  test "should get new" do
    get new_foreign_courses_student_url
    assert_response :success
  end

  test "should create foreign_courses_student" do
    assert_difference('CoursesStudent.count') do
      post foreign_courses_students_url, params: { foreign_courses_student: { foreign_course_id: @foreign_courses_student.foreign_course_id, student_id: @foreign_courses_student.student_id } }
    end

    assert_redirected_to foreign_courses_student_url(ForeignCoursesStudent.last)
  end

  test "should show foreign_courses_student" do
    get foreign_courses_student_url(@foreign_courses_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_foreign_courses_student_url(@foreign_courses_student)
    assert_response :success
  end

  test "should update foreign_courses_student" do
    patch foreign_courses_student_url(@foreign_courses_student), params: { foreign_courses_student: { foreign_course_id: @foreign_courses_student.foreign_course_id, student_id: @foreign_courses_student.student_id } }
    assert_redirected_to foreign_courses_student_url(@foreign_courses_student)
  end

  test "should destroy foreign_courses_student" do
    assert_difference('CoursesStudent.count', -1) do
      delete foreign_courses_student_url(@foreign_courses_student)
    end

    assert_redirected_to foreign_courses_students_url
  end
end
