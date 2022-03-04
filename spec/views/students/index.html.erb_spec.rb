require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        tamu_department: nil,
        user: nil,
        tamu_major: "Tamu Major",
        tamu_college: "Tamu College",
        classification: ""
      ),
      Student.create!(
        tamu_department: nil,
        user: nil,
        tamu_major: "Tamu Major",
        tamu_college: "Tamu College",
        classification: ""
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Tamu Major".to_s, count: 2
    assert_select "tr>td", text: "Tamu College".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
