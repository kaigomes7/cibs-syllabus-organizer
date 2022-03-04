require 'rails_helper'

RSpec.describe "reviewers/edit", type: :view do
  before(:each) do
    @reviewer = assign(:reviewer, Reviewer.create!(
      tamu_department: nil,
      user: ""
    ))
  end

  it "renders the edit reviewer form" do
    render

    assert_select "form[action=?][method=?]", reviewer_path(@reviewer), "post" do

      assert_select "input[name=?]", "reviewer[tamu_department_id]"

      assert_select "input[name=?]", "reviewer[user]"
    end
  end
end
