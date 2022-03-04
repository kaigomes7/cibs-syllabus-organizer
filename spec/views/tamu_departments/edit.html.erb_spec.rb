require 'rails_helper'

RSpec.describe "tamu_departments/edit", type: :view do
  before(:each) do
    @tamu_department = assign(:tamu_department, TamuDepartment.create!(
      tamu_department_name: "MyString"
    ))
  end

  it "renders the edit tamu_department form" do
    render

    assert_select "form[action=?][method=?]", tamu_department_path(@tamu_department), "post" do

      assert_select "input[name=?]", "tamu_department[tamu_department_name]"
    end
  end
end
