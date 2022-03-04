require 'rails_helper'

RSpec.describe "tamu_courses/edit", type: :view do
  before(:each) do
    @tamu_course = assign(:tamu_course, TamuCourse.create!(
      tamu_department: nil,
      course_num: 1,
      course_name: "MyString"
    ))
  end

  it "renders the edit tamu_course form" do
    render

    assert_select "form[action=?][method=?]", tamu_course_path(@tamu_course), "post" do

      assert_select "input[name=?]", "tamu_course[tamu_department_id]"

      assert_select "input[name=?]", "tamu_course[course_num]"

      assert_select "input[name=?]", "tamu_course[course_name]"
    end
  end
end
