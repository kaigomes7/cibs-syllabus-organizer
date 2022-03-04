require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        user: ""
      ),
      Admin.create!(
        user: ""
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
