require 'rails_helper'

RSpec.describe "tamu_courses/show", type: :view do
  before(:each) do
    @tamu_course = assign(:tamu_course, TamuCourse.create!(
      course_num: 2,
      tamu_department: nil,
      course_name: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
