require 'rails_helper'

RSpec.describe "foreign_courses_students/edit", type: :view do
  before(:each) do
    @foreign_courses_student = assign(:foreign_courses_student, ForeignCoursesStudent.create!(
      student: nil,
      foreign_course: nil,
      admin_course_approval: false
    ))
  end

  it "renders the edit foreign_courses_student form" do
    render

    assert_select "form[action=?][method=?]", foreign_courses_student_path(@foreign_courses_student), "post" do

      assert_select "input[name=?]", "foreign_courses_student[student_id]"

      assert_select "input[name=?]", "foreign_courses_student[foreign_course_id]"

      assert_select "input[name=?]", "foreign_courses_student[admin_course_approval]"
    end
  end
end
