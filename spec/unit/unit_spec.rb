# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe University, type: :model do
  subject do
    described_class.new(country: 'USA', university_name: 'Harvard')
	
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a country' do
    subject.country = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe University, type: :model do
  subject do
    described_class.new(country: 'USA', university_name: 'Harvard')
	
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a university_name' do
    subject.university_name = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe TamuDepartment, type: :model do
  subject do
    described_class.new(tamu_department_name: 'CSCE')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a tamu_department_name' do
    subject.tamu_department_name = nil
    expect(subject).not_to be_valid
  end
end

describe Admin do
  describe "#create admin" do
    before do
	  @admin = Admin.new(name: "jake",email: "jake@gmail.com")
	  @admin_no_name = Admin.new(email:"jake@gmail.com")
	  @admin_no_email = Admin.new(name:"jake")
	  @admin_null = Admin.new()
	end
	
	it 'is valid with valid attributes' do
	  expect(@admin).to be_valid
	end
	
	it 'is not valid without a name' do
      expect(@admin_no_name).not_to be_valid
    end
	
	it 'is not valid without an email' do
	  expect(@admin_no_email).not_to be_valid
	end
	
	it 'is not valid with nothing' do
	  expect(@admin_null).not_to be_valid
	end
	
  end
end

describe University do
  describe "#create university" do
    before do
	  @university = University.new(country: "UK", university_name: "Oxford")
	  @university_no_country = University.new(university_name: "Oxford")
	  @university_no_name = University.new(country: "UK")
	  @university_null = University.new()
	end
	
	it 'is valid with valid attributes' do
	  expect(@university).to be_valid
	end
	
	it 'is not valid without a country' do
	  expect(@university_no_country).not_to be_valid
	end
	
	it 'is valid with valid attributes' do
	  expect(@university_no_name).not_to be_valid
	end
	
	it 'is valid with valid attributes' do
	  expect(@university_null).not_to be_valid
	end
	
  end
end

describe TamuCourse do
  describe "#create tamu_course" do
    before do
	  @tamudepartment = TamuDepartment.new(tamu_department_name: "CSCE")
	  @tamudepartment.save
	  @tamucourse = TamuCourse.new(course_num: 5, tamu_department_id: @tamudepartment.id)
	  @tamucourse_invalid_num = TamuCourse.new(course_num: "hello", tamu_department_id: 1)
	  @tamucourse_invalid_department = TamuCourse.new(course_num: 5, tamu_department_id: "4")
	  @tamucourse_no_department = TamuCourse.new(course_num: 5)
	  @tamucourse_no_num = TamuCourse.new(course_num: 5, tamu_department_id: 1)
	  @tamucourse_null = TamuCourse.new()
	end
	
	it 'is valid with valid attributes' do
	  expect(@tamucourse).to be_valid
	end
	
	it 'is not valid without a valid num' do
	  expect(@tamucourse_invalid_num).not_to be_valid
	end
	
	it 'is not valid without a valid department' do
	  expect(@tamucourse_invalid_department).not_to be_valid
	end
	
	it 'is not valid without a num' do
	  expect(@tamucourse_no_num).not_to be_valid
	end
	
	it 'is not valid without a department' do
	  expect(@tamucourse_no_department).not_to be_valid
	end
	
  end
end

describe Student do
  describe "#create student" do
    before do
	  @tamudepartment = TamuDepartment.new(tamu_department_name: "CSCE")
	  @tamudepartment.save
	  @student = Student.new(student_email: 'arthur@camelot.com', student_name: 'arthur', tamu_department_id:@tamudepartment.id)
	  @student_invalid_email = Student.new(student_email: 555, student_name: 'arthur', tamu_department_id:1)
	  @student_no_email = Student.new(student_name: 'arthur', tamu_department_id:1)
	  @student_invalid_name = Student.new(student_email: 'arthur@camelot.com', student_name: 'arthur', tamu_department_id:1)
	  @student_no_name = Student.new(student_email: 'arthur@camelot.com', student_name: 'arthur', tamu_department_id:1)
	  @student_invalid_department = Student.new(student_email: 'arthur@camelot.com', student_name: 'arthur', tamu_department_id:"3")
	  @student_no_department = Student.new(student_email: 'arthur@camelot.com', student_name: 'arthur')
	  @student_null = Student.new()
	end
	
	it 'is valid with valid attributes' do
	  expect(@student).to be_valid
	end
	
	it 'is not valid without a valid email' do
	  expect(@student_invalid_email).not_to be_valid
	end
	
	it 'is not valid with no email' do
	  expect(@student_no_email).not_to be_valid
	end
	
	it 'is not valid with invalid name' do
	  expect(@student_invalid_name).not_to be_valid
	end
	
	it 'is not valid without a name' do
	  expect(@student_no_name).not_to be_valid
	end
	
	it 'is not valid without a valid dept' do
	  expect(@student_invalid_department).not_to be_valid
	end
	
	it 'is not valid without a dept' do
	  expect(@student_no_department).not_to be_valid
	end
	
	it 'is not valid when null' do
	  expect(@student_null).not_to be_valid
	end
	
  end
end

describe Reviewer do
  describe "#create reviewer" do
    before do
	  @tamudepartment = TamuDepartment.new(tamu_department_name: "CSCE")
	  @tamudepartment.save
	  @reviewer = Reviewer.new(:reviewer_email: 'arthur@camelot.com', 