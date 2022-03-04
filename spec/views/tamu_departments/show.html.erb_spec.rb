require 'rails_helper'

RSpec.describe "tamu_departments/show", type: :view do
  before(:each) do
    @tamu_department = assign(:tamu_department, TamuDepartment.create!(
      tamu_department_name: "Tamu Department Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tamu Department Name/)
  end
end
