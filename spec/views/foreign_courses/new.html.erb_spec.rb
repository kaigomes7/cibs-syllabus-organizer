require 'rails_helper'

RSpec.describe "foreign_courses/new", type: :view do
  before(:each) do
    assign(:foreign_course, ForeignCourse.new(
      foreign_course_name: "MyString",
      contact_hours: 1,
      semester_approved: "MyString",
      tamu_department: nil,
      university: nil,
      foreign_course_num: 1,
      foreign_course_dept: "MyString",
      course_approval_status: ""
    ))
  end

  it "renders new foreign_course form" do
    render

    assert_select "form[action=?][method=?]", foreign_courses_path, "post" do

      assert_select "input[name=?]", "foreign_course[foreign_course_name]"

      assert_select "input[name=?]", "foreign_course[contact_hours]"

      assert_select "input[name=?]", "foreign_course[semester_approved]"

      assert_select "input[name=?]", "foreign_course[tamu_department_id]"

      assert_select "input[name=?]", "foreign_course[university_id]"

      assert_select "input[name=?]", "foreign_course[foreign_course_num]"

      assert_select "input[name=?]", "foreign_course[foreign_course_dept]"

      assert_select "input[name=?]", "foreign_course[course_approval_status]"
    end
  end
end
