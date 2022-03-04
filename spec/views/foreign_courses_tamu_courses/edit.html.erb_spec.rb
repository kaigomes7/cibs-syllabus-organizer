require 'rails_helper'

RSpec.describe "foreign_courses_tamu_courses/edit", type: :view do
  before(:each) do
    @foreign_courses_tamu_course = assign(:foreign_courses_tamu_course, ForeignCoursesTamuCourse.create!(
      foreign_course: nil,
      tamu_course: ""
    ))
  end

  it "renders the edit foreign_courses_tamu_course form" do
    render

    assert_select "form[action=?][method=?]", foreign_courses_tamu_course_path(@foreign_courses_tamu_course), "post" do

      assert_select "input[name=?]", "foreign_courses_tamu_course[foreign_course_id]"

      assert_select "input[name=?]", "foreign_courses_tamu_course[tamu_course]"
    end
  end
end
