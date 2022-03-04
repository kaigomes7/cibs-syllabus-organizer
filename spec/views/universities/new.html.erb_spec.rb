require 'rails_helper'

RSpec.describe "universities/new", type: :view do
  before(:each) do
    assign(:university, University.new(
      city_country: "MyString",
      university_name: ""
    ))
  end

  it "renders new university form" do
    render

    assert_select "form[action=?][method=?]", universities_path, "post" do

      assert_select "input[name=?]", "university[city_country]"

      assert_select "input[name=?]", "university[university_name]"
    end
  end
end
