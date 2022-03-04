require 'rails_helper'

RSpec.describe "foreign_courses_students/new", type: :view do
  before(:each) do
    assign(:foreign_courses_student, ForeignCoursesStudent.new(
      student: nil,
      foreign_course: nil,
      admin_course_approval: false
    ))
  end

  it "renders new foreign_courses_student form" do
    render

    assert_select "form[action=?][method=?]", foreign_courses_students_path, "post" do

      assert_select "input[name=?]", "foreign_courses_student[student_id]"

      assert_select "input[name=?]", "foreign_courses_student[foreign_course_id]"

      assert_select "input[name=?]", "foreign_courses_student[admin_course_approval]"
    end
  end
end
