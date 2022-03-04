require 'rails_helper'

RSpec.describe "foreign_courses/show", type: :view do
  before(:each) do
    @foreign_course = assign(:foreign_course, ForeignCourse.create!(
      tamu_department_id: 2,
      foreign_course_name: "Foreign Course Name",
      contact_hours: 3,
      semester_approved: "Semester Approved",
      foreign_course_dept: "Foreign Course Dept",
      foreign_course_num: 4,
      course_approval_status: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Foreign Course Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Semester Approved/)
    expect(rendered).to match(/Foreign Course Dept/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/false/)
  end
end
