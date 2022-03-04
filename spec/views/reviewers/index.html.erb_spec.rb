require 'rails_helper'

RSpec.describe "reviewers/index", type: :view do
  before(:each) do
    assign(:reviewers, [
      Reviewer.create!(
        user: nil,
        tamu_department: nil
      ),
      Reviewer.create!(
        user: nil,
        tamu_department: nil
      )
    ])
  end

  it "renders a list of reviewers" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
