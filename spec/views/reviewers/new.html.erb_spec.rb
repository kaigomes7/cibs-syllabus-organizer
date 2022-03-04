require 'rails_helper'

RSpec.describe "reviewers/new", type: :view do
  before(:each) do
    assign(:reviewer, Reviewer.new(
      user: nil,
      tamu_department: nil
    ))
  end

  it "renders new reviewer form" do
    render

    assert_select "form[action=?][method=?]", reviewers_path, "post" do

      assert_select "input[name=?]", "reviewer[user_id]"

      assert_select "input[name=?]", "reviewer[tamu_department_id]"
    end
  end
end
