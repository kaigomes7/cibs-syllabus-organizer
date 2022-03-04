require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      tamu_department: nil,
      user: nil,
      tamu_major: "MyString",
      tamu_college: "MyString",
      classification: ""
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[tamu_department_id]"

      assert_select "input[name=?]", "student[user_id]"

      assert_select "input[name=?]", "student[tamu_major]"

      assert_select "input[name=?]", "student[tamu_college]"

      assert_select "input[name=?]", "student[classification]"
    end
  end
end
