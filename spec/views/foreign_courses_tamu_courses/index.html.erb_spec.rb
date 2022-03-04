require 'rails_helper'

RSpec.describe "foreign_courses_tamu_courses/index", type: :view do
  before(:each) do
    assign(:foreign_courses_tamu_courses, [
      ForeignCoursesTamuCourse.create!(
        foreign_course: nil,
        tamu_course: ""
      ),
      ForeignCoursesTamuCourse.create!(
        foreign_course: nil,
        tamu_course: ""
      )
    ])
  end

  it "renders a list of foreign_courses_tamu_courses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
