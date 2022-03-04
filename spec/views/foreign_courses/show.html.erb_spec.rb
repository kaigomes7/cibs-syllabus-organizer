require 'rails_helper'

RSpec.describe "foreign_courses/show", type: :view do
  before(:each) do
    @foreign_course = assign(:foreign_course, ForeignCourse.create!(
      foreign_course_name: "Foreign Course Name",
      contact_hours: 2,
      semester_approved: "Semester Approved",
      tamu_department: nil,
      university: nil,
      foreign_course_num: 3,
      foreign_course_dept: "Foreign Course Dept",
      course_approval_status: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Foreign Course Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Semester Approved/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Foreign Course Dept/)
    expect(rendered).to match(//)
  end
end
