require 'rails_helper'

RSpec.describe "foreign_courses_tamu_courses/new", type: :view do
  before(:each) do
    assign(:foreign_courses_tamu_course, ForeignCoursesTamuCourse.new(
      foreign_course: nil,
      tamu_course: ""
    ))
  end

  it "renders new foreign_courses_tamu_course form" do
    render

    assert_select "form[action=?][method=?]", foreign_courses_tamu_courses_path, "post" do

      assert_select "input[name=?]", "foreign_courses_tamu_course[foreign_course_id]"

      assert_select "input[name=?]", "foreign_courses_tamu_course[tamu_course]"
    end
  end
end
