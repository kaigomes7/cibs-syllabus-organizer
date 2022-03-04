require 'rails_helper'

RSpec.describe "tamu_courses/new", type: :view do
  before(:each) do
    assign(:tamu_course, TamuCourse.new(
      course_num: 1,
      tamu_department: nil,
      course_name: ""
    ))
  end

  it "renders new tamu_course form" do
    render

    assert_select "form[action=?][method=?]", tamu_courses_path, "post" do

      assert_select "input[name=?]", "tamu_course[course_num]"

      assert_select "input[name=?]", "tamu_course[tamu_department_id]"

      assert_select "input[name=?]", "tamu_course[course_name]"
    end
  end
end
