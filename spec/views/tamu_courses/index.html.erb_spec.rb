require 'rails_helper'

RSpec.describe "tamu_courses/index", type: :view do
  before(:each) do
    assign(:tamu_courses, [
      TamuCourse.create!(
        course_num: 2,
        tamu_department: nil,
        course_name: ""
      ),
      TamuCourse.create!(
        course_num: 2,
        tamu_department: nil,
        course_name: ""
      )
    ])
  end

  it "renders a list of tamu_courses" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
