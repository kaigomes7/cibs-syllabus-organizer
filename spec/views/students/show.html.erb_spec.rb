require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      tamu_department: nil,
      user: nil,
      tamu_major: "Tamu Major",
      tamu_college: "Tamu College",
      classification: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Tamu Major/)
    expect(rendered).to match(/Tamu College/)
    expect(rendered).to match(//)
  end
end
