require 'rails_helper'

RSpec.describe "foreign_courses_students/show", type: :view do
  before(:each) do
    @foreign_courses_student = assign(:foreign_courses_student, ForeignCoursesStudent.create!(
      foreign_course: nil,
      student: nil,
      admin_course_approval: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
