require 'rails_helper'

RSpec.describe "foreign_courses/index", type: :view do
  before(:each) do
    assign(:foreign_courses, [
      ForeignCourse.create!(
        tamu_department_id: 2,
        foreign_course_name: "Foreign Course Name",
        contact_hours: 3,
        semester_approved: "Semester Approved",
        foreign_course_dept: "Foreign Course Dept",
        foreign_course_num: 4,
        course_approval_status: false
      ),
      ForeignCourse.create!(
        tamu_department_id: 2,
        foreign_course_name: "Foreign Course Name",
        contact_hours: 3,
        semester_approved: "Semester Approved",
        foreign_course_dept: "Foreign Course Dept",
        foreign_course_num: 4,
        course_approval_status: false
      )
    ])
  end

  it "renders a list of foreign_courses" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Foreign Course Name".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Semester Approved".to_s, count: 2
    assert_select "tr>td", text: "Foreign Course Dept".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
