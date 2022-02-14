# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe CoursesStudent, type: :model do
  subject do
    described_class.new(student_id: 1)
    described_class.new(foreign_course_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.student_id = nil
    expect(subject).no	t_to be_valid
  end
end