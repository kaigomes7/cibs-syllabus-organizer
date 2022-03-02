require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        name: "Name",
        email: "Email"
      ),
      Admin.create!(
        name: "Name",
        email: "Email"
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
