require 'rails_helper'

RSpec.describe "tamu_courses/show", type: :view do
  before(:each) do
    @tamu_course = assign(:tamu_course, TamuCourse.create!(
      tamu_department: nil,
      course_num: 2,
      course_name: "Course Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Course Name/)
  end
end
