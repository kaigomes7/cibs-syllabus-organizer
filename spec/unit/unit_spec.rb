# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Admins, type: :model do
  subject do
    described_class.new(name: 'Arthur', email: 'arthur@camelot.com')
	
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Admins, type: :model do
  subject do
    described_class.new(name: 'Arthur', email: 'arthur@camelot.com')
	
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
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

  it 'is not valid without a country' do
    subject.university_name = nil
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

=begin
I need to figure out how to create examples.
In this case, tamu_department_id doesn't work because a tamu_department doesn't exist

RSpec.describe TamuCourse, type: :model do
  
  subject do
    described_class.new(course_num: '50', tamu_department_id: '1')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a course_num' do
    subject.course_num = nil
    expect(subject).not_to be_valid
  end
end
=end