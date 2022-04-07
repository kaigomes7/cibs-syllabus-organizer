# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe University, type: :model do
  subject do
    described_class.new(city_country: 'Houston Texas', university_name: 'UH')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a country' do
    subject.city_country = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe University, type: :model do
  subject do
    described_class.new(city_country: 'USA', university_name: 'Harvard')
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

describe User do
  describe '#create user' do
    before do
      @user = User.new(name: 'jake', email: 'jake@gmail.com', role: 0, uid: 1)
      @user_no_name = User.new(email: 'jake@gmail.com', role: 0, uid: 1)
      @user_no_email = User.new(name: 'jake', role: 0, uid: 1)
      @user_no_role = User.new(name: 'jake', email: 'jake@gmail.com', uid: 1)
      @user_no_uid = User.new(name: 'jake', email: 'jake@gmail.com', role: 0)
      @user_null = User.new
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'invalid: name' do
      expect(@user_no_email).not_to be_valid
    end

    it 'invalid: email' do
      expect(@user_no_email).not_to be_valid
    end

    it 'invalid: uid' do
      expect(@user_no_uid).not_to be_valid
    end

    # null is ok
    # it 'invalid: role' do
    #  expect(@user_no_role).not_to be_valid
    # end

    it 'invalid: null' do
      expect(@user_null).not_to be_valid
    end
  end
end

describe Admin do
  describe '#create admin' do
    before do
      @user = User.new(name: 'jake', email: 'jake@gmail.com', role: 0, uid: 2)
      @user.save
      @admin = Admin.new(user_id: @user.id)
    end

    it 'is valid with valid attributes' do
      expect(@admin).to be_valid
    end
  end
end

describe University do
  describe '#create university' do
    before do
      @university = University.new(city_country: 'UK', university_name: 'Oxford')
      @university_no_country = University.new(university_name: 'Oxford')
      @university_no_name = University.new(city_country: 'UK')
      @university_null = University.new
    end

    it 'is valid with valid attributes' do
      expect(@university).to be_valid
    end

    it 'is not valid without a country' do
      expect(@university_no_country).not_to be_valid
    end

    it 'is valid not valid without a name' do
      expect(@university_no_name).not_to be_valid
    end

    it 'is valid with valid attributes' do
      expect(@university_null).not_to be_valid
    end
  end
end

describe TamuCourse do
  describe '#create tamu_course' do
    before do
      @tamudepartment = TamuDepartment.new(tamu_department_name: 'CSCE')
      @tamudepartment.save
      @tamucourse = TamuCourse.new(course_num: 431, tamu_department_id: @tamudepartment.id,
                                   course_name: 'Software Engineering')
      @tamucourse_no_id = TamuCourse.new(course_num: 431, course_name: 'Software Engineering')
      @tamucourse_iv_id = TamuCourse.new(course_num: 431, tamu_department_id: -5, course_name: 'Software Engineering')
      @tamucourse_no_course_num = TamuCourse.new(tamu_department_id: @tamudepartment.id,
                                                 course_name: 'Software Engineering')
      @tamucourse_no_course_name = TamuCourse.new(course_num: 431, tamu_department_id: @tamudepartment.id)
      @tamucourse_null = TamuCourse.new
    end

    it 'is valid with valid attributes' do
      expect(@tamucourse).to be_valid
    end

    it 'no id fail' do
      expect(@tamucourse_no_id).not_to be_valid
    end

    it 'invalid id fail' do
      expect(@tamucourse_iv_id).not_to be_valid
    end

    it 'no course_num fail' do
      expect(@tamucourse_no_course_num).not_to be_valid
    end

    it 'no course name fail' do
      expect(@tamucourse_no_course_name).not_to be_valid
    end

    it 'null fails' do
      expect(@tamucourse_null).not_to be_valid
    end
  end
end

describe Student do
  describe '#create student' do
    before do
      @user = User.new(name: 'jake', email: 'jake@gmail.com', role: 0, uid: 3)
      @user.save
      @tamudepartment = TamuDepartment.new(tamu_department_name: 'CSCE')
      @tamudepartment.save

      @student = Student.new(tamu_department_id: @tamudepartment.id, user_id: @user.id, tamu_major: 'CompSCi',
                             tamu_college: 'Engineering', classification: 'Junior')
      @student_invalid_department = Student.new(tamu_department_id: '-5', user_id: @user.id, tamu_major: 'CompSCi',
                                                tamu_college: 'Engineering', classification: 'Junior')
      @student_no_department = Student.new(user_id: @user.id, tamu_major: 'CompSCi', tamu_college: 'Engineering',
                                           classification: 'Junior')
      @student_invalid_user_id = Student.new(tamu_department_id: @tamudepartment.id, user_id: '-3', tamu_major: 'CompSCi',
                                             tamu_college: 'Engineering', classification: 'Junior')
      @student_no_user_id = Student.new(tamu_department_id: @tamudepartment.id, tamu_major: 'CompSCi',
                                        tamu_college: 'Engineering', classification: 'Junior')
      @student_no_major = Student.new(tamu_department_id: @tamudepartment.id, user_id: @user.id,
                                      tamu_college: 'Engineering', classification: 'Junior')
      @student_no_college = Student.new(tamu_department_id: @tamudepartment.id, user_id: @user.id, tamu_major: 'CompSCi',
                                        classification: 'Junior')
      @student_no_classification = Student.new(tamu_department_id: @tamudepartment.id, user_id: @user.id,
                                               tamu_major: 'CompSCi', tamu_college: 'Engineering')
      @student_null = Student.new
    end

    it 'is valid with valid attributes' do
      expect(@student).to be_valid
    end

    it 'is not valid without a valid dept' do
      expect(@student_invalid_department).not_to be_valid
    end

    it 'is not valid without a dept' do
      expect(@student_no_department).not_to be_valid
    end

    it 'is not valid without valid user id' do
      expect(@student_invalid_user_id).not_to be_valid
    end

    it 'is not valid without a user id' do
      expect(@student_no_user_id).not_to be_valid
    end

    it 'is not valid without a major' do
      expect(@student_no_major).not_to be_valid
    end

    it 'is not valid without a college' do
      expect(@student_no_college).not_to be_valid
    end

    it 'is not valid without a classification' do
      expect(@student_no_classification).not_to be_valid
    end

    it 'is not valid when null' do
      expect(@student_null).not_to be_valid
    end
  end
end

describe Reviewer do
  describe '#create reviewer' do
    before do
      @user = User.new(name: 'jake', email: 'jake@gmail.com', role: 0, uid: 1)
      @user.save
      @tamudepartment = TamuDepartment.new(tamu_department_name: 'CSCE')
      @tamudepartment.save

      @reviewer = Reviewer.new(tamu_department_id: @tamudepartment.id, user_id: @user.id)
      @reviewer_iv_dept_id = Reviewer.new(tamu_department_id: '-3', user_id: @user.id)
      @reviewer_no_dept_id = Reviewer.new(user_id: @user.id)
      @reviewer_iv_user_id = Reviewer.new(tamu_department_id: @tamudepartment.id, user_id: '-3')
      @reviewer_no_user_id = Reviewer.new(tamu_department_id: @tamudepartment.id)
      @reviewer_null = Reviewer.new
    end

    it 'is valid with valid inputs' do
      expect(@reviewer).to be_valid
    end

    it 'is invalid with invalid department id' do
      expect(@reviewer_iv_dept_id).not_to be_valid
    end

    it 'is invalid with no department id' do
      expect(@reviewer_no_dept_id).not_to be_valid
    end

    it 'is invalid with invalid user id' do
      expect(@reviewer_iv_user_id).not_to be_valid
    end

    it 'is invalid with no user id' do
      expect(@reviewer_no_user_id).not_to be_valid
    end

    it 'is invalid when null' do
      expect(@reviewer_null).not_to be_valid
    end
  end
end

describe ForeignCourse do
  describe '#create ForeignCourse' do
    before do
      @tamudepartment = TamuDepartment.new(tamu_department_name: 'CSCE')
      @tamudepartment.save
      @university = University.new(city_country: 'UK', university_name: 'Oxford')
      @university.save

      @foreign_course = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 3,
                                          semester_approved: 'Fall 2020', foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                                      filename: 'test_syllabus.pdf', content_type: 'application/pdf')
      @foreign_course_no_name = ForeignCourse.new(contact_hours: 3, semester_approved: 'Fall 2020',
                                                  foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course_iv_hours = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 'sfi',
                                                   semester_approved: 'Fall 2020', foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course_no_hours = ForeignCourse.new(foreign_course_name: 'Software Engineering',
                                                   semester_approved: 'Fall 2020', foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course_no_semester = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 3,
                                                      foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course_no_num = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 3,
                                                 semester_approved: 'Fall 2020', foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course_no_dept = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 3,
                                                  semester_approved: 'Fall 2020', foreign_course_num: 431, course_approval_status: false, tamu_department_id: @tamudepartment.id, university_id: @university.id)
      @foreign_course_no_dept_id = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 3,
                                                     semester_approved: 'Fall 2020', foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, university_id: @university.id)
      @foreign_course_no_uni_id = ForeignCourse.new(foreign_course_name: 'Software Engineering', contact_hours: 3,
                                                    semester_approved: 'Fall 2020', foreign_course_num: 431, foreign_course_dept: 'CSCE', course_approval_status: false, tamu_department_id: @tamudepartment.id)
      @foreign_course_null = ForeignCourse.new
    end

    it 'is valid with valid inputs' do
      expect(@foreign_course).to be_valid
    end

    it 'is invalid: no name' do
      expect(@foreign_course_no_name).not_to be_valid
    end

    it 'is invalid: no hours' do
      expect(@foreign_course_no_hours).not_to be_valid
    end

    it 'is invalid: no semester' do
      expect(@foreign_course_no_semester).not_to be_valid
    end

    it 'is invalid: no number' do
      expect(@foreign_course_no_num).not_to be_valid
    end

    it 'is invalid: no department' do
      expect(@foreign_course_no_dept).not_to be_valid
    end

    it 'is invalid: no department id' do
      expect(@foreign_course_no_dept_id).not_to be_valid
    end

    it 'is invalid: no university id' do
      expect(@foreign_course_no_uni_id).not_to be_valid
    end

    it 'is invalid: null' do
      expect(@foreign_course_null).not_to be_valid
    end
  end
end
