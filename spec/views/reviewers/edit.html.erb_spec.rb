require 'rails_helper'

RSpec.describe "reviewers/edit", type: :view do
  before(:each) do
    @reviewer = assign(:reviewer, Reviewer.create!(
      user: nil,
      tamu_department: nil
    ))
  end

  it "renders the edit reviewer form" do
    render

    assert_select "form[action=?][method=?]", reviewer_path(@reviewer), "post" do

      assert_select "input[name=?]", "reviewer[user_id]"

      assert_select "input[name=?]", "reviewer[tamu_department_id]"
    end
  end
end
