require 'rails_helper'

RSpec.describe "universities/index", type: :view do
  before(:each) do
    assign(:universities, [
      University.create!(
        city_country: "City Country",
        university_name: ""
      ),
      University.create!(
        city_country: "City Country",
        university_name: ""
      )
    ])
  end

  it "renders a list of universities" do
    render
    assert_select "tr>td", text: "City Country".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
