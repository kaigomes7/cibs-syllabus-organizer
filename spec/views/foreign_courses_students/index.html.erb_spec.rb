require 'rails_helper'

RSpec.describe "foreign_courses_students/index", type: :view do
  before(:each) do
    assign(:foreign_courses_students, [
      ForeignCoursesStudent.create!(
        foreign_course: nil,
        student: nil,
        admin_course_approval: false
      ),
      ForeignCoursesStudent.create!(
        foreign_course: nil,
        student: nil,
        admin_course_approval: false
      )
    ])
  end

  it "renders a list of foreign_courses_students" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
