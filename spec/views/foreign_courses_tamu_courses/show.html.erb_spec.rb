require 'rails_helper'

RSpec.describe "foreign_courses_tamu_courses/show", type: :view do
  before(:each) do
    @foreign_courses_tamu_course = assign(:foreign_courses_tamu_course, ForeignCoursesTamuCourse.create!(
      tamu_course: nil,
      foreign_course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
