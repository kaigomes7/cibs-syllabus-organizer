require 'rails_helper'

RSpec.describe "tamu_courses/index", type: :view do
  before(:each) do
    assign(:tamu_courses, [
      TamuCourse.create!(
        tamu_department: nil,
        course_num: 2,
        course_name: "Course Name"
      ),
      TamuCourse.create!(
        tamu_department: nil,
        course_num: 2,
        course_name: "Course Name"
      )
    ])
  end

  it "renders a list of tamu_courses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Course Name".to_s, count: 2
  end
end
