require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        user: nil,
        tamu_department: nil,
        tamu_major: "Tamu Major",
        tamu_college: "Tamu College",
        classification: "Classification"
      ),
      Student.create!(
        user: nil,
        tamu_department: nil,
        tamu_major: "Tamu Major",
        tamu_college: "Tamu College",
        classification: "Classification"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Tamu Major".to_s, count: 2
    assert_select "tr>td", text: "Tamu College".to_s, count: 2
    assert_select "tr>td", text: "Classification".to_s, count: 2
  end
end
