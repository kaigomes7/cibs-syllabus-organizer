require 'rails_helper'

RSpec.describe "reviewers/show", type: :view do
  before(:each) do
    @reviewer = assign(:reviewer, Reviewer.create!(
      user: nil,
      tamu_department: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
