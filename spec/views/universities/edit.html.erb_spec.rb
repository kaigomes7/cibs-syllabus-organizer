require 'rails_helper'

RSpec.describe "universities/edit", type: :view do
  before(:each) do
    @university = assign(:university, University.create!(
      city_country: "MyString",
      university_name: ""
    ))
  end

  it "renders the edit university form" do
    render

    assert_select "form[action=?][method=?]", university_path(@university), "post" do

      assert_select "input[name=?]", "university[city_country]"

      assert_select "input[name=?]", "university[university_name]"
    end
  end
end
