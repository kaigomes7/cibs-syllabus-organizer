require 'rails_helper'

RSpec.describe "tamu_departments/index", type: :view do
  before(:each) do
    assign(:tamu_departments, [
      TamuDepartment.create!(
        tamu_department_name: ""
      ),
      TamuDepartment.create!(
        tamu_department_name: ""
      )
    ])
  end

  it "renders a list of tamu_departments" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
