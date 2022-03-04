require 'rails_helper'

RSpec.describe "foreign_courses_tamu_courses/index", type: :view do
  before(:each) do
    assign(:foreign_courses_tamu_courses, [
      ForeignCoursesTamuCourse.create!(
        tamu_course: nil,
        foreign_course: nil
      ),
      ForeignCoursesTamuCourse.create!(
        tamu_course: nil,
        foreign_course: nil
      )
    ])
  end

  it "renders a list of foreign_courses_tamu_courses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
