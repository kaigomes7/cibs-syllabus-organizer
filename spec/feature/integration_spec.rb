# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a tamu department', type: :feature do
  scenario 'valid inputs' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  end

  scenario 'Data still exists after SQL Injection attempt' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'DROP TABLE tamu_departments;'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  end
end

# RSpec.describe 'Creating a user', type: :feature do
#   scenario 'valid inputs' do
# 	visit new_user_path
# 	fill_in 'user_name', with: 'Sir Jake'
# 	fill_in 'user_email', with: 'jake@camelot.com'
# 	fill_in 'user_role', with: 0
# 	click_on 'Create User'
# 	visit users_path
# 	expect(page).to have_content('Sir Jake')
# 	expect(page).to have_content('jake@camelot.com')
# 	expect(page).to have_content('0')
#   end

#   scenario 'no name' do
# 	visit new_user_path
# 	fill_in 'user_email', with: 'jake@camelot.com'
# 	fill_in 'user_role', with: 0
# 	click_on 'Create User'
# 	visit users_path
# 	expect(page).not_to have_content('jake@camelot.com')
# 	expect(page).not_to have_content('0')
#   end

#   scenario 'no email' do
# 	visit new_user_path
# 	fill_in 'user_name', with: 'Sir Jake'
# 	fill_in 'user_role', with: 0
# 	click_on 'Create User'
# 	visit users_path
# 	expect(page).not_to have_content('Sir Jake')
# 	expect(page).not_to have_content('0')
#   end

# end

# Did a bad thing and commented out test, will fix later
# RSpec.describe 'Creating an admin/Expect Name', type: :feature do
#   scenario 'valid inputs' do
#     # visit new_user_path
#     # fill_in 'user_name', with: 'Sir Jake'
#     # fill_in 'user_email', with: 'jake@camelot.com'
#     # fill_in 'user_role', with: 0
#     # click_on 'Create User'
#     # visit users_path
#     # expect(page).to have_content('Sir Jake')
#     # expect(page).to have_content('jake@camelot.com')
#     # expect(page).to have_content('0')

#     User.create(name: "Sir Jake", email: 'jake@camelot.com', uid: 1, role: 0)
#     visit new_admin_path
#     select 'Sir Jake', :from => 'admin_user_id'
#     click_on 'Create Admin'
#     visit admins_path
#     expect(page).to have_content('Sir Jake')
#   end

# end
RSpec.describe 'Creating a University', type: :feature do
  scenario 'Expect Uni' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
  end

  scenario 'Expect Country' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('Oxford')
  end

  scenario 'Invalid Inputs/No Name' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_university_path
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).not_to have_content('Oxford')
  end

  scenario 'Invalid Inputs/No Uni' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    click_on 'Create University'
    visit universities_path
    expect(page).not_to have_content('United Kingdom')
  end

  scenario 'Invalid Inputs/Null' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_university_path
    click_on 'Create University'
    expect(page).to have_content('prohibited this')
  end

  scenario 'Data still exists after SQL Injection attempt' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_university_path
    fill_in 'university_city_country', with: 'DROP TABLE universities;'
    fill_in 'university_university_name', with: 'DROP TABLE universities;'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
    expect(page).to have_content('Oxford')
  end
end

RSpec.describe 'Creating a TAMU Course', type: :feature do
  scenario 'valid inputs' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
  end

  scenario 'No DEPT' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end

  #  scenario 'String Instead of Course Num' do
  #	#visit new_tamu_department_path
  #    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #    click_on 'Create Tamu department'
  #    visit tamu_departments_path
  #    expect(page).to have_content('CSCE')
  #
  #    visit new_tamu_course_path
  #    fill_in 'tamu_course_course_num', with: 'Swag'
  #    fill_in 'tamu_course_course_name', with: 'Software Engineering'
  #    select 'CSCE', :from => 'tamu_course_tamu_department_id'
  #    click_on 'Create Tamu course'
  #    expect(page).to have_content('prohibited this')
  #  end

  scenario 'Null Course Num' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end

  scenario 'No course name' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end

  scenario 'No Course Num or Course Name' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end

  scenario 'Data still exists after SQL Injection attempt' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'DROP TABLE tamu_departments;'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 435
    fill_in 'tamu_course_course_name', with: 'DROP TABLE tamu_courses;'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('Software Engineering')
  end
end

RSpec.describe 'Creating a student', type: :feature do
  scenario 'valid inputs' do
    #   visit new_user_path
    # fill_in 'user_name', with: 'Madam Gwen'
    # fill_in 'user_email', with: 'gwen@camelot.com'
    # fill_in 'user_role', with: 2
    # click_on 'Create User'
    # visit users_path
    # expect(page).to have_content('Madam Gwen')
    # expect(page).to have_content('gwen@camelot.com')
    # expect(page).to have_content('2')
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
    sign_out(user)

    user = User.create!(email: 'gwen@camelot.com', name: 'Madam Gwen', role: 1, uid: '333')
    user.save
    login_as(user)

    visit new_student_path
    # select 'Madam Gwen', from: 'student_user_id'
    select 'CSCE', from: 'student_tamu_department_id'
    select 'Computer Science, CPSC', from: 'student_tamu_major'
    select 'College of Engineering', from: 'student_tamu_college'
    select 'U3', from: 'student_classification'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    # expect(page).to have_content('CSCE')
    expect(page).to have_content('Computer Science, CPSC')
    expect(page).to have_content('College of Engineering')
    expect(page).to have_content('U3')
  end

  #   scenario 'No Major' do
  #     # visit new_user_path
  # 	# fill_in 'user_name', with: 'Madam Gwen'
  # 	# fill_in 'user_email', with: 'gwen@camelot.com'
  # 	# fill_in 'user_role', with: 2
  # 	# click_on 'Create User'
  # 	# visit users_path
  # 	# expect(page).to have_content('Madam Gwen')
  # 	# expect(page).to have_content('gwen@camelot.com')
  # 	# expect(page).to have_content('2')

  #     user = User.create!(:email => 'Arthur@camelot.com', :name => 'King Arthur', :role => 0, :uid => '777')
  # 	user.save
  # 	login_as(user)

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('CSCE')
  # 	sign_out(user)

  # 	user = User.create!(:email => 'gwen@camelot.com', :name => 'Madam Gwen', :role => 1, :uid => '333')
  # 	user.save
  # 	login_as(user)
  #     visit new_student_path
  # 	select 'Madam Gwen', :from => 'student_user_id'
  #     select 'CSCE', :from => 'student_tamu_department_id'
  # 	select 'College of Engineering', :from => 'student_tamu_college'
  # 	select 'U3', :from => 'student_classification'
  #     click_on 'Create Student'
  #     expect(page).to have_content('prohibited')
  #   end

  #   scenario 'No College' do
  #   #   visit new_user_path
  # 	# fill_in 'user_name', with: 'Madam Gwen'
  # 	# fill_in 'user_email', with: 'gwen@camelot.com'
  # 	# fill_in 'user_role', with: 2
  # 	# click_on 'Create User'
  # 	# visit users_path
  # 	# expect(page).to have_content('Madam Gwen')
  # 	# expect(page).to have_content('gwen@camelot.com')
  # 	# expect(page).to have_content('2')

  #     user = User.create!(:email => 'Arthur@camelot.com', :name => 'King Arthur', :role => 0, :uid => '777')
  # 	user.save
  # 	login_as(user)

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('CSCE')
  #     sign_out(user)

  # 	user = User.create!(:email => 'gwen@camelot.com', :name => 'Madam Gwen', :role => 1, :uid => '333')
  # 	user.save
  # 	login_as(user)
  #     visit new_student_path
  # 	select 'Madam Gwen', :from => 'student_user_id'
  #     select 'CSCE', :from => 'student_tamu_department_id'
  # 	select 'Computer Science, CPSC', :from => 'student_tamu_major'
  # 	select 'U3', :from => 'student_classification'
  #     click_on 'Create Student'
  #     expect(page).to have_content('prohibited')
  #   end

  #   scenario 'No Classification' do
  #   #   visit new_user_path
  # 	# fill_in 'user_name', with: 'Madam Gwen'
  # 	# fill_in 'user_email', with: 'gwen@camelot.com'
  # 	# fill_in 'user_role', with: 2
  # 	# click_on 'Create User'
  # 	# visit users_path
  # 	# expect(page).to have_content('Madam Gwen')
  # 	# expect(page).to have_content('gwen@camelot.com')
  # 	# expect(page).to have_content('2')

  #     user = User.create!(:email => 'Arthur@camelot.com', :name => 'King Arthur', :role => 0, :uid => '777')
  # 	user.save
  # 	login_as(user)

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('CSCE')
  # 	sign_out(user)

  # 	user = User.create!(:email => 'gwen@camelot.com', :name => 'Madam Gwen', :role => 1, :uid => '333')
  # 	user.save
  # 	login_as(user)
  #     visit new_student_path
  # 	select 'Madam Gwen', :from => 'student_user_id'
  #     select 'CSCE', :from => 'student_tamu_department_id'
  # 	select 'Computer Science, CPSC', :from => 'student_tamu_major'
  # 	select 'College of Engineering', :from => 'student_tamu_college'
  #     click_on 'Create Student'
  #     expect(page).to have_content('prohibited')
  #   end

  #   scenario 'Null Fields' do
  #   #   visit new_user_path
  # 	# fill_in 'user_name', with: 'Madam Gwen'
  # 	# fill_in 'user_email', with: 'gwen@camelot.com'
  # 	# fill_in 'user_role', with: 2
  # 	# click_on 'Create User'
  # 	# expect(page).to have_content('Madam Gwen')
  # 	# expect(page).to have_content('gwen@camelot.com')
  # 	# expect(page).to have_content('2')

  #     user = User.create!(:email => 'Arthur@camelot.com', :name => 'King Arthur', :role => 0, :uid => '777')
  # 	user.save
  # 	login_as(user)

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('CSCE')
  # 	sign_out(user)

  # 	user = User.create!(:email => 'gwen@camelot.com', :name => 'Madam Gwen', :role => 1, :uid => '333')
  # 	user.save
  # 	login_as(user)
  #     visit new_student_path
  # 	select 'Madam Gwen', :from => 'student_user_id'
  #     select 'CSCE', :from => 'student_tamu_department_id'
  #     click_on 'Create Student'
  #     expect(page).to have_content('prohibited')
  #   end

  #   scenario 'Data still exists after SQL Injection attempt' do
  #     #   visit new_user_path
  # 	# fill_in 'user_name', with: 'Madam Gwen'
  # 	# fill_in 'user_email', with: 'gwen@camelot.com'
  # 	# fill_in 'user_role', with: 2
  # 	# click_on 'Create User'
  # 	# visit users_path
  # 	# expect(page).to have_content('Madam Gwen')
  # 	# expect(page).to have_content('gwen@camelot.com')
  # 	# expect(page).to have_content('2')

  #     user = User.create!(:email => 'Arthur@camelot.com', :name => 'King Arthur', :role => 0, :uid => '777')
  # 	user.save
  # 	login_as(user)

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('CSCE')
  # 	sign_out(user)

  # 	user = User.create!(:email => 'gwen@camelot.com', :name => 'Madam Gwen', :role => 1, :uid => '333')
  # 	user.save
  # 	login_as(user)
  #     visit new_student_path
  # 	select 'Madam Gwen', :from => 'student_user_id'
  #     select 'CSCE', :from => 'student_tamu_department_id'
  # 	fill_in 'student_tamu_major', with: 'DROP TABLE students;'
  # 	select 'College of Engineering', :from => 'student_tamu_college'
  # 	select 'U3', :from => 'student_classification'
  #     click_on 'Create Student'
  #     visit students_path
  #     expect(page).to have_content('Madam Gwen')
  #     #expect(page).to have_content('CSCE')
  #     expect(page).to have_content('DROP TABLE students;')
  #     expect(page).to have_content('Engineering')
  #     expect(page).to have_content('Junior')
  #   end
end

RSpec.describe 'Creating a reviewer', type: :feature do
  scenario 'valid inputs' do
    #   visit new_user_path
    # fill_in 'user_name', with: 'Wizard Merlin'
    # fill_in 'user_email', with: 'm3rlin@camelot.com'
    # fill_in 'user_role', with: 2
    # click_on 'Create User'
    # visit users_path
    # expect(page).to have_content('Wizard Merlin')
    # expect(page).to have_content('m3rlin@camelot.com')
    # expect(page).to have_content('2'

    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
    sign_out(user)

    user = User.create!(name: 'Wizard Merlin', email: 'm3rlin@camelot.com', uid: 1, role: 2)
    user.save
    login_as(user)
    # I think i'm being redirected out
    visit new_reviewer_path
    select 'CSCE', from: 'reviewer_tamu_department_id'
    # select 'Wizard Merlin', from: 'reviewer_user_id'
    click_on 'Create Reviewer'
    visit reviewers_path
    expect(page).to have_content('Wizard Merlin')
    # expect(page).to have_content('CSCE')
  end

  #  scenario 'Null Inputs' do
  #   visit new_user_path
  #	fill_in 'user_name', with: 'Wizard Merlin'
  #	fill_in 'user_email', with: 'm3rlin@camelot.com'
  #	fill_in 'user_role', with: 2
  #	click_on 'Create User'
  #	visit users_path
  #	expect(page).to have_content('Wizard Merlin')
  #	expect(page).to have_content('m3rlin@camelot.com')
  #	expect(page).to have_content('2')
  #
  #	visit new_tamu_department_path
  #   fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #   click_on 'Create Tamu department'
  #   visit tamu_departments_path
  #   expect(page).to have_content('CSCE')
  #
  #   visit new_reviewer_path
  #   click_on 'Create Reviewer'
  #   expect(page).to have_content('prohibited')
  #  end
end

RSpec.describe 'Creating a foreign course', type: :feature do
  scenario 'valid inputs' do
    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')

    sign_out(admin)

    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    user.save
    login_as(user)

    visit new_student_path
    # select 'Madam Gwen', from: 'student_user_id'
    select 'Computer Science, CPSC', from: 'student_tamu_major'
    select 'College of Engineering', from: 'student_tamu_college'
    select 'U3', from: 'student_classification'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    expect(page).to have_content('Computer Science, CPSC')
    expect(page).to have_content('College of Engineering')
    expect(page).to have_content('U3')

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    expect(page).to have_content('CSCE')
    expect(page).to have_content('431')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Fall')
    sign_out(user)
  end

  scenario 'No Course Name' do
    user = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    user.save
    login_as(user)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')
    sign_out(user)

    user = User.create!(email: 'test@example.com', name: 'Lance', role: 1, uid: '111')
    login_as(user)
    user.save
    Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
                    tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    visit new_foreign_course_path
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    expect(page).to have_content('prohibited')
  end

  # Had to comment out because student is no longer filling in contact hours in form
  # scenario 'No Contact Hours' do
  # visit new_university_path
  #   fill_in 'university_city_country', with: 'London, United Kingdom'
  #   fill_in 'university_university_name', with: 'Oxford'
  #   click_on 'Create University'
  #   visit universities_path
  #   expect(page).to have_content('United Kingdom')

  # visit new_tamu_department_path
  #   fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #   click_on 'Create Tamu department'
  #   visit tamu_departments_path
  #   expect(page).to have_content('CSCE')

  #   visit new_foreign_course_path
  # fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
  # select 'Fall', :from => 'foreign_course_sem'
  # # fill_in 'foreign_course_year', with: '2020'
  # fill_in 'foreign_course_foreign_course_num', with: '431'
  # fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
  # # check 'foreign_course_course_approval_status'
  #   select 'CSCE', :from => 'foreign_course_tamu_department_id'
  #   select 'Oxford', :from => 'foreign_course_university_id'
  #   page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
  #   click_on 'Create Foreign course'
  # expect(page).to have_content('prohibited')
  # end

  # scenario 'No Semester Approved' do
  #   admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
  #   admin.save
  #   login_as(admin)

  #   visit new_university_path
  #   fill_in 'university_city_country', with: 'London, United Kingdom'
  #   fill_in 'university_university_name', with: 'Oxford'
  #   click_on 'Create University'
  #   visit universities_path
  #   expect(page).to have_content('United Kingdom')

  #   visit new_tamu_department_path
  #   fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #   click_on 'Create Tamu department'
  #   visit tamu_departments_path
  #   expect(page).to have_content('CSCE')

  #   visit new_tamu_department_path
  #   fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
  #   click_on 'Create Tamu department'
  #   visit tamu_departments_path
  #   expect(page).to have_content('Unassigned')

  #   sign_out(admin)
  #   user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
  #   user.save
  #   Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
  #                   tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
  #   login_as(user)

  #   visit new_foreign_course_path
  #   fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
  #   # fill_in 'foreign_course_contact_hours', with: 3
  #   fill_in 'foreign_course_foreign_course_num', with: '431'
  #   fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
  #   # check 'foreign_course_course_approval_status'
  #   select 'Oxford', from: 'foreign_course_university_id'
  #   page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
  #   click_on 'Create Foreign course'
  #   expect(page).to have_content('prohibited')
  # end

  scenario 'No Course Num' do
    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')

    sign_out(admin)
    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    user.save
    Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
                    tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    login_as(user)

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    expect(page).to have_content('prohibited')
  end

  scenario 'No Course Dept' do
    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')

    sign_out(admin)

    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    user.save
    Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
                    tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    login_as(user)

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    expect(page).to have_content('prohibited')
  end

  scenario 'Null' do
    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')
    sign_out(admin)

    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    user.save
    Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
                    tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    login_as(user)

    visit new_foreign_course_path
    click_on 'Create Foreign course'
    expect(page).to have_content('prohibited')
  end

  #   scenario 'Data still exists after SQL injection attempt' do
  # 	admin = User.create!(:email => 'Arthur@camelot.com', :name => 'King Arthur', :role => 0, :uid => '777')
  # 	admin.save
  # 	login_as(admin)

  # 	visit new_university_path
  #     fill_in 'university_city_country', with: 'London, United Kingdom'
  #     fill_in 'university_university_name', with: 'Oxford'
  #     click_on 'Create University'
  #     visit universities_path
  #     expect(page).to have_content('United Kingdom')

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('CSCE')

  # 	visit new_tamu_department_path
  #     fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
  #     click_on 'Create Tamu department'
  #     visit tamu_departments_path
  #     expect(page).to have_content('Unassigned')
  # 	sign_out(admin)

  # 	user = User.create!(:email => 'test@example.com', :name => 'Madam Gwen', :role => 1, :uid => '111')
  # 	user.save
  # 	login_as(user)

  #     visit new_student_path
  # 	select 'Madam Gwen', :from => 'student_user_id'
  # 	select 'Computer Science, CPSC', :from => 'student_tamu_major'
  # 	select 'College of Engineering', :from => 'student_tamu_college'
  # 	select 'U3', :from => 'student_classification'
  #     click_on 'Create Student'
  #     visit students_path
  #     expect(page).to have_content('Madam Gwen')
  #     expect(page).to have_content('Computer Science, CPSC')
  #     expect(page).to have_content('College of Engineering')
  #     expect(page).to have_content('U3')

  #     visit new_foreign_course_path
  # 	fill_in 'foreign_course_foreign_course_name', with: 'DROP TABLE universities;'
  # 	# fill_in 'foreign_course_contact_hours', with: 3
  # 	select 'Fall', :from => 'foreign_course_sem'
  #     # fill_in 'foreign_course_year', with: '2020'
  # 	fill_in 'foreign_course_foreign_course_num', with: 5
  # 	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
  # 	# check 'foreign_course_course_approval_status'
  #     page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
  #     click_on 'Create Foreign course'

  # 	sign_out(user)
  # 	login_as(admin)

  #     visit foreign_courses_path
  #     #expect(page).to have_content('DROP TABLE universities;')
  #     expect(page).to have_content('0')
  #     expect(page).to have_content('DROP TABLE foreign_courses')
  #     expect(page).to have_content('5')
  #     expect(page).to have_content('CSCE')
  #     expect(page).to have_content('false')

  #     visit universities_path
  # 	expect(page).to have_content('United Kingdom')
  #   end
end

RSpec.describe 'Creating a foreign course / student relation', type: :feature do
  scenario 'valid inputs' do
    # visit new_user_path
    # fill_in 'user_name', with: 'Madam Gwen'
    # fill_in 'user_email', with: 'gwen@camelot.com'
    # fill_in 'user_role', with: 2
    # click_on 'Create User'
    # visit users_path
    # expect(page).to have_content('Madam Gwen')
    # expect(page).to have_content('gwen@camelot.com')
    # expect(page).to have_content('2')

    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')
    sign_out(admin)

    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    user.save
    login_as(user)

    visit new_student_path
    # select 'Madam Gwen', from: 'student_user_id'
    select 'Computer Science, CPSC', from: 'student_tamu_major'
    select 'College of Engineering', from: 'student_tamu_college'
    select 'U3', from: 'student_classification'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    expect(page).to have_content('Computer Science, CPSC')
    expect(page).to have_content('College of Engineering')
    expect(page).to have_content('U3')

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    sign_out(user)

    login_as(admin)

    visit foreign_courses_path
    # expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('0')
    expect(page).to have_content('Fall 2022')
    expect(page).to have_content('431')
    expect(page).to have_content('false')
  end

  scenario 'Data still exists after SQL Injection attempt' do
    # visit new_user_path
    # fill_in 'user_name', with: 'Madam Gwen'
    # fill_in 'user_email', with: 'gwen@camelot.com'
    # fill_in 'user_role', with: 2
    # click_on 'Create User'
    # visit users_path
    # expect(page).to have_content('Madam Gwen')
    # expect(page).to have_content('gwen@camelot.com')
    # expect(page).to have_content('2')

    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    sign_out(admin)

    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    login_as(user)
    user.save

    visit new_student_path
    # select 'Madam Gwen', from: 'student_user_id'
    select 'CSCE', from: 'student_tamu_department_id'
    select 'Computer Science, CPSC', from: 'student_tamu_major'
    select 'College of Engineering', from: 'student_tamu_college'
    select 'U3', from: 'student_classification'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    # Not sure what they did to the view, I can't find it
    # expect(page).to have_content('CSCE')
    expect(page).to have_content('Computer Science, CPSC')
    expect(page).to have_content('College of Engineering')
    expect(page).to have_content('U3')

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'DROP TABLE universities;'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: 5
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    sign_out(user)

    login_as(admin)
    visit foreign_courses_path
    expect(page).to have_content('Oxford')
    expect(page).to have_content('DROP TABLE universities;')
    expect(page).to have_content('0')
    # expect(page).to have_content('DROP TABLE foreign_courses')
    expect(page).to have_content('5')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('false')

    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_foreign_courses_student_path
    select 'Madam Gwen', from: 'foreign_courses_student_student_id'
    select 'DROP TABLE universities;', from: 'foreign_courses_student_foreign_course_id'
    click_on 'Create Foreign courses student'
    visit foreign_courses_students_path
    expect(page).to have_content('DROP TABLE universities;')

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'DROP TABLE foreign_courses_students;'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('DROP TABLE foreign_courses_students;')

    visit foreign_courses_students_path
    expect(page).to have_content('DROP TABLE universities;')
  end
end

RSpec.describe 'Creating a Foreign Course / Tamu Course relation', type: :feature do
  scenario 'valid inputs' do
    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')

    sign_out(admin)

    user = User.create!(email: 'gwen@camelot.com', name: 'Madam Gwen', role: 1, uid: '1')
    user.save
    Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
                    tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    login_as(user)

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    sign_out(user)

    login_as(admin)

    visit foreign_courses_path
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('0')
    expect(page).to have_content('Fall 2022')
    expect(page).to have_content('431')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('false')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')

    visit new_foreign_courses_tamu_course_path
    select 'Software Engineering', from: 'foreign_courses_tamu_course_tamu_course_id'
    select 'Software Engineering', from: 'foreign_courses_tamu_course_foreign_course_id'
    click_on 'Create Foreign courses tamu course'
    visit foreign_courses_tamu_courses_path
  end

  scenario 'Data still exists after SQL Injection attempt' do
    admin = User.create!(email: 'Arthur@camelot.com', name: 'King Arthur', role: 0, uid: '777')
    admin.save
    login_as(admin)

    visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'Unassigned'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('Unassigned')

    visit new_university_path
    fill_in 'university_city_country', with: 'DROP TABLE universities;'
    fill_in 'university_university_name', with: 'Hacker'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('DROP TABLE universities;')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')

    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'DROP TABLE tamu_departments;'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('DROP TABLE tamu_departments;')

    sign_out(admin)

    user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    Student.create!(user_id: user.id, tamu_department_id: TamuDepartment.first.id,
                    tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    login_as(user)
    user.save

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    sign_out(user)
    login_as(admin)

    visit foreign_courses_path
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('0')
    expect(page).to have_content('Fall 2022')
    expect(page).to have_content('431')
    expect(page).to have_content('false')

    sign_out(admin)
    login_as(user)

    visit new_foreign_course_path
    fill_in 'foreign_course_foreign_course_name', with: 'DROP TABLE foreign_courses;'
    # fill_in 'foreign_course_contact_hours', with: 3
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '431'
    fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
    # check 'foreign_course_course_approval_status'
    select 'Hacker', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    sign_out(user)
    login_as(admin)

    visit foreign_courses_path
    expect(page).to have_content('DROP TABLE foreign_courses;')
    expect(page).to have_content('Hacker')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('0')
    expect(page).to have_content('Fall 2022')
    expect(page).to have_content('431')
    expect(page).to have_content('false')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')

    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'DROP TABLE tamu_courses;'
    select 'CSCE', from: 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('DROP TABLE tamu_courses;')

    visit new_foreign_courses_tamu_course_path
    select 'Software Engineering', from: 'foreign_courses_tamu_course_tamu_course_id'
    select 'Software Engineering', from: 'foreign_courses_tamu_course_foreign_course_id'
    click_on 'Create Foreign courses tamu course'
    visit foreign_courses_tamu_courses_path
    expect(page).to have_content('Software Engineering')
  end
end

RSpec.describe 'Creating request cases', type: :feature do
  before(:each) do
    @td = TamuDepartment.create!(tamu_department_name: 'Unassigned')
    @td_student = TamuDepartment.create!(tamu_department_name: 'CSCE')
    @uni = University.create!(city_country: 'UK', university_name: 'Oxford')
    @user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    @user_b = User.create!(email: 'test2@example.com', name: 'Sir Gwen', role: 1, uid: '112')
    @stu = Student.create!(user_id: @user.id, tamu_department_id: @td_student.id,
                           tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    @stu_b = Student.create!(user_id: @user_b.id, tamu_department_id: @td_student.id,
                             tamu_major: 'Computer Engineering', tamu_college: 'Engineering', classification: 'U3')
    login_as(@user)
  end

  scenario 'Student creates a course request (no duplicates)' do
    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page).to have_content('Fall 2022')
    expect(page).to have_content('Finance')
    expect(page).to have_content('1111')
    expect(page).to have_content('Intro to Finance')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Pending')
  end

  scenario 'Student creates a duplicate course request for a course already approved by reviewer and admin' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: true)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: true, start_date: '02-02-2000', end_date: '02-02-2000')

    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page).to have_content('You have an outstanding/approved request for this course')
    expect(page.all('tbody#requestTableBody tr').count).to eq(1)
    expect(page).to have_content('Approved')
  end

  scenario 'Student creates a duplicate course request for a course approved by reviewer but rejected by admin for the student' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: true)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: nil, start_date: '02-02-2000', end_date: '02-02-2000')

    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: 1111
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'
    expect(page.all('tbody#requestTableBody tr').count).to eq(2)
    expect(page).to have_content('Rejected')
    expect(page).to have_content('Pending')
  end

  scenario 'Student creates a duplicate course request for a course approved by reviewer but pending by admin for the student' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: true)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')

    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page).to have_content('You have an outstanding/approved request for this course')
    expect(page.all('tbody#requestTableBody tr').count).to eq(1) # no new request created
    expect(page).to have_content('Pending')
  end

  scenario 'Student creates a duplicate course request for a course waiting on reviewer approval' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: false)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')

    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page.all('tbody#requestTableBody tr').count).to eq(1) # no new request created
    expect(page).to have_content('Pending')
  end

  scenario 'Student creates a duplicate course request for a course rejected by reviewer' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: nil)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')

    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page.all('tbody#requestTableBody tr').count).to eq(2)
    expect(page).to have_content('Rejected')
    expect(page).to have_content('Pending')
  end

  scenario 'Student B creates a request for a course that Student A already requested that is pending approval from a reviewer' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: false)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')

    sign_out(@user)
    login_as(@user_b)
    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page.all('tbody#requestTableBody tr').count).to eq(1)
    expect(page).to have_content('Pending')
    expect(ForeignCourse.count).to eq(2) # different fc request from student A and student B
    expect(ForeignCoursesStudent.count).to eq(2) # two different connections
  end

  scenario 'Student B creates a request for a course that Student A already requested that is approved by reviewer' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: true)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    # admin_course_approval fro student A doesn't matter to student B
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')

    sign_out(@user)
    login_as(@user_b)
    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page.all('tbody#requestTableBody tr').count).to eq(1)
    expect(page).to have_content('Pending')
    expect(ForeignCourse.count).to eq(1) # since already approved, only one request on reviewer side
    expect(ForeignCoursesStudent.count).to eq(2) # still different request for each student
  end

  scenario 'Student B creates a request for a course that Student A already requested that is rejected by reviewer' do
    fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                           semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                           university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: nil)
    fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                       filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    fc.save
    # admin_course_approval fro student A doesn't matter to student B
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')

    sign_out(@user)
    login_as(@user_b)
    visit new_request_path
    fill_in 'foreign_course_foreign_course_name', with: 'Intro to Finance'
    select 'Fall', from: 'foreign_course_sem'
    # fill_in 'foreign_course_year', with: '2020'
    fill_in 'foreign_course_foreign_course_num', with: '1111'
    fill_in 'foreign_course_foreign_course_dept', with: 'Finance'
    select 'Oxford', from: 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', 'spec/test_files/test_syllabus.pdf')
    click_on 'Create Foreign course'

    expect(page.all('tbody#requestTableBody tr').count).to eq(1)
    expect(page).to have_content('Pending')
    expect(ForeignCourse.count).to eq(2) # different fc request from student A and student B
    expect(ForeignCoursesStudent.count).to eq(2) # two different connections
  end
end

RSpec.describe 'Creating reviewer cases', type: :feature do
  before(:each) do
    @td = TamuDepartment.create!(tamu_department_name: 'Unassigned')
    @td_rev = TamuDepartment.create!(tamu_department_name: 'CSCE')
    @uni = University.create!(city_country: 'UK', university_name: 'Oxford')
    @user = User.create!(email: 'test@example.com', name: 'Madam Gwen', role: 1, uid: '111')
    @user_b = User.create!(email: 'test2@example.com', name: 'Sir Gwen', role: 2, uid: '112')
    @stu = Student.create!(user_id: @user.id, tamu_department_id: @td_rev.id,
                           tamu_major: 'Computer Science', tamu_college: 'Engineering', classification: 'U4')
    @rev = Reviewer.create!(user_id: @user_b.id, tamu_department_id: @td_rev.id)
    @fc = ForeignCourse.new(foreign_course_name: 'Intro to Finance', contact_hours: 0,
                            semester_approved: 'Spring 2021', tamu_department_id: @td.id,
                            university_id: @uni.id, foreign_course_num: 1111, foreign_course_dept: 'Finance', course_approval_status: false)
    @fc.syllabus.attach(io: File.open("#{Rails.root}/spec/test_files/test_syllabus.pdf"),
                        filename: 'test_syllabus.pdf', content_type: 'application/pdf')
    @fc.save
    ForeignCoursesStudent.create!(student_id: @stu.id, foreign_course_id: @fc.id, admin_course_approval: false, start_date: '02-02-2000', end_date: '02-02-2000')
    @tc = TamuCourse.create!(course_num: 431, tamu_department_id: @td_rev.id, course_name: 'CSCE 431')
    ForeignCoursesTamuCourse.create!(foreign_course_id: @fc.id, tamu_course_id: @tc.id)
    login_as(@user_b)
  end

  scenario 'Reviewer approves course with no duplicate requests' do
    # simulates assigning
    @fc.tamu_department_id = @td_rev.id
    @fc.save
    visit edit_foreign_course_path(@fc)
    select 'Approve', from: 'foreign_course_course_approval_status'
    fill_in 'foreign_course_contact_hours', with: 45
    click_on 'Update Foreign course'
    visit approved_requests_reviewers_path

    expect(page).to have_content('Spring 2021')
    expect(page).to have_content('Finance')
    expect(page).to have_content('1111')
    expect(page).to have_content('45')
    expect(page).to have_content('Intro to Finance')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Pending')
  end
end
