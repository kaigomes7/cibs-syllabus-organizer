require 'rails_helper'

RSpec.describe "tamu_departments/index", type: :view do
  before(:each) do
    assign(:tamu_departments, [
      TamuDepartment.create!(
        tamu_department_name: "Tamu Department Name"
      ),
      TamuDepartment.create!(
        tamu_department_name: "Tamu Department Name"
      )
    ])
  end

  it "renders a list of tamu_departments" do
    render
    assert_select "tr>td", text: "Tamu Department Name".to_s, count: 2
  end
end
