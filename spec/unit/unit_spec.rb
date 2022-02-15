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

  it 'is not valid without a country' do
    subject.tamu_department_name = nil
    expect(subject).not_to be_valid
  end
end