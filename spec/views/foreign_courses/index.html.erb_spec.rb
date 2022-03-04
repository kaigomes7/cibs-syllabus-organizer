require 'rails_helper'

RSpec.describe "foreign_courses/index", type: :view do
  before(:each) do
    assign(:foreign_courses, [
      ForeignCourse.create!(
        foreign_course_name: "Foreign Course Name",
        contact_hours: 2,
        semester_approved: "Semester Approved",
        tamu_department: nil,
        university: nil,
        foreign_course_num: 3,
        foreign_course_dept: "Foreign Course Dept",
        course_approval_status: ""
      ),
      ForeignCourse.create!(
        foreign_course_name: "Foreign Course Name",
        contact_hours: 2,
        semester_approved: "Semester Approved",
        tamu_department: nil,
        university: nil,
        foreign_course_num: 3,
        foreign_course_dept: "Foreign Course Dept",
        course_approval_status: ""
      )
    ])
  end

  it "renders a list of foreign_courses" do
    render
    assert_select "tr>td", text: "Foreign Course Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Semester Approved".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Foreign Course Dept".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
