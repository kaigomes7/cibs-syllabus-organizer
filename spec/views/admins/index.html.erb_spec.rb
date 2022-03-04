require 'rails_helper'

RSpec.describe "admins/index", type: :view do
  before(:each) do
    assign(:admins, [
      Admin.create!(
        user: nil
      ),
      Admin.create!(
        user: nil
      )
    ])
  end

  it "renders a list of admins" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
