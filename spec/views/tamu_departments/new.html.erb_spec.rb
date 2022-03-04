require 'rails_helper'

RSpec.describe "tamu_departments/new", type: :view do
  before(:each) do
    assign(:tamu_department, TamuDepartment.new(
      tamu_department_name: ""
    ))
  end

  it "renders new tamu_department form" do
    render

    assert_select "form[action=?][method=?]", tamu_departments_path, "post" do

      assert_select "input[name=?]", "tamu_department[tamu_department_name]"
    end
  end
end
