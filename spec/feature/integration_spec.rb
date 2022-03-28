# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a tamu department', type: :feature do
  scenario 'valid inputs' do
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  end
  
  scenario 'Data still exists after SQL Injection attempt' do
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


RSpec.describe 'Creating an admin/Expect Name', type: :feature do
  scenario 'valid inputs' do
    # visit new_user_path
    # fill_in 'user_name', with: 'Sir Jake'
    # fill_in 'user_email', with: 'jake@camelot.com'
    # fill_in 'user_role', with: 0
    # click_on 'Create User'
    # visit users_path
    # expect(page).to have_content('Sir Jake')
    # expect(page).to have_content('jake@camelot.com')
    # expect(page).to have_content('0')

    User.create(name: "Sir Jake", email: 'jake@camelot.com', uid: 1)
    visit new_admin_path
    select 'Sir Jake', :from => 'admin_user_id'
    click_on 'Create Admin'
    visit admins_path
    expect(page).to have_content('Sir Jake')
  end
 
end	

RSpec.describe 'Creating a University', type: :feature do
  scenario 'Expect Uni' do
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
  end
  
  scenario 'Expect Country' do
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('Oxford')
  end
  
  scenario 'Invalid Inputs/No Name' do
    visit new_university_path
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).not_to have_content('Oxford')
  end
  
  scenario 'Invalid Inputs/No Uni' do
    visit new_university_path
    fill_in 'university_city_country', with: 'United Kingdom'
    click_on 'Create University'
    visit universities_path
    expect(page).not_to have_content('United Kingdom')
  end  
  
  scenario 'Invalid Inputs/Null' do
    visit new_university_path
    click_on 'Create University'
    expect(page).to have_content('prohibited this')
  end
  
  scenario 'Data still exists after SQL Injection attempt' do
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
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
  end
  
  scenario 'No DEPT' do
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
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end
  
  scenario 'No course name' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end
  
  scenario 'No Course Num or Course Name' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    expect(page).to have_content('prohibited this')
  end
  
  scenario 'Data still exists after SQL Injection attempt' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
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
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
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
    User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_major', with: 'CompSci'
	fill_in 'student_tamu_college', with: 'Engineering'
	fill_in 'student_classification', with: 'Junior'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('CompSci')
    expect(page).to have_content('Engineering')
    expect(page).to have_content('Junior')
  end

  scenario 'No Major' do
    # visit new_user_path
	# fill_in 'user_name', with: 'Madam Gwen'
	# fill_in 'user_email', with: 'gwen@camelot.com'
	# fill_in 'user_role', with: 2
	# click_on 'Create User'
	# visit users_path
	# expect(page).to have_content('Madam Gwen')
	# expect(page).to have_content('gwen@camelot.com')
	# expect(page).to have_content('2')
  User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_college', with: 'Engineering'
	fill_in 'student_classification', with: 'Junior'
    click_on 'Create Student'
    expect(page).to have_content('prohibited')
  end

  scenario 'No College' do
  #   visit new_user_path
	# fill_in 'user_name', with: 'Madam Gwen'
	# fill_in 'user_email', with: 'gwen@camelot.com'
	# fill_in 'user_role', with: 2
	# click_on 'Create User'
	# visit users_path
	# expect(page).to have_content('Madam Gwen')
	# expect(page).to have_content('gwen@camelot.com')
	# expect(page).to have_content('2')
  User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_major', with: 'CompSci'
	fill_in 'student_classification', with: 'Junior'
    click_on 'Create Student'
    expect(page).to have_content('prohibited')
  end
  
  scenario 'No Classification' do
  #   visit new_user_path
	# fill_in 'user_name', with: 'Madam Gwen'
	# fill_in 'user_email', with: 'gwen@camelot.com'
	# fill_in 'user_role', with: 2
	# click_on 'Create User'
	# visit users_path
	# expect(page).to have_content('Madam Gwen')
	# expect(page).to have_content('gwen@camelot.com')
	# expect(page).to have_content('2')
  User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_major', with: 'CompSci'
	fill_in 'student_tamu_college', with: 'Engineering'
    click_on 'Create Student'
    expect(page).to have_content('prohibited')
  end
  
  scenario 'Null Fields' do
  #   visit new_user_path
	# fill_in 'user_name', with: 'Madam Gwen'
	# fill_in 'user_email', with: 'gwen@camelot.com'
	# fill_in 'user_role', with: 2
	# click_on 'Create User'
	# expect(page).to have_content('Madam Gwen')
	# expect(page).to have_content('gwen@camelot.com')
	# expect(page).to have_content('2')
  User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    expect(page).to have_content('prohibited')
  end

  scenario 'Data still exists after SQL Injection attempt' do
    #   visit new_user_path
	# fill_in 'user_name', with: 'Madam Gwen'
	# fill_in 'user_email', with: 'gwen@camelot.com'
	# fill_in 'user_role', with: 2
	# click_on 'Create User'
	# visit users_path
	# expect(page).to have_content('Madam Gwen')
	# expect(page).to have_content('gwen@camelot.com')
	# expect(page).to have_content('2')
    User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_major', with: 'DROP TABLE students;'
	fill_in 'student_tamu_college', with: 'Engineering'
	fill_in 'student_classification', with: 'Junior'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('DROP TABLE students;')
    expect(page).to have_content('Engineering')
    expect(page).to have_content('Junior')
  end

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
	# expect(page).to have_content('2')
    User.create(name: "Wizard Merlin", email: 'm3rlin@camelot.com', uid: 1)
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_reviewer_path
    select 'CSCE', :from => 'reviewer_tamu_department_id'
	select 'Wizard Merlin', :from => 'reviewer_user_id'
    click_on 'Create Reviewer'
    visit reviewers_path
    expect(page).to have_content('Wizard Merlin')
    expect(page).to have_content('CSCE')
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('3')
    expect(page).to have_content('Fall 2020')
    expect(page).to have_content('431')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
  end
  
  scenario 'No Course Name' do
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
	expect(page).to have_content('prohibited')
  end
  
  scenario 'No Contact Hours' do
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
	expect(page).to have_content('prohibited')
  end
  
  scenario 'No Semester Approved' do
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
	expect(page).to have_content('prohibited')
  end
  
  scenario 'No Course Num' do
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
	expect(page).to have_content('prohibited')
  end
  
  scenario 'No Course Dept' do
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
	expect(page).to have_content('prohibited')
  end
  
  scenario 'Null' do
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
	
    visit new_foreign_course_path
    click_on 'Create Foreign course'
	expect(page).to have_content('prohibited')
  end	  
  
  scenario 'Data still exists after SQL injection attempt' do
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'DROP TABLE universities;'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'DROP TABLE foreign_courses;'
	fill_in 'foreign_course_foreign_course_num', with: 5
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('DROP TABLE universities;')
    expect(page).to have_content('3')
    expect(page).to have_content('DROP TABLE foreign_courses')
    expect(page).to have_content('5')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
	
    visit universities_path
	expect(page).to have_content('United Kingdom')
  end
  
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
    User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_major', with: 'CompSci'
	fill_in 'student_tamu_college', with: 'Engineering'
	fill_in 'student_classification', with: 'Junior'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('CompSci')
    expect(page).to have_content('Engineering')
    expect(page).to have_content('Junior')
	
	visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('3')
    expect(page).to have_content('Fall 2020')
    expect(page).to have_content('431')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
	
	visit new_foreign_courses_student_path
	  select 'Madam Gwen', :from => 'foreign_courses_student_student_id'
	  select 'Software Engineering', :from => 'foreign_courses_student_foreign_course_id'
	  click_on 'Create Foreign courses student'
	  visit foreign_courses_students_path
    expect(page).to have_content('Software Engineering')
	
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
    User.create(name: "Madam Gwen", email: 'gwen@camelot.com', uid: 1)
  
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
	select 'Madam Gwen', :from => 'student_user_id'
    select 'CSCE', :from => 'student_tamu_department_id'
	fill_in 'student_tamu_major', with: 'CompSci'
	fill_in 'student_tamu_college', with: 'Engineering'
	fill_in 'student_classification', with: 'Junior'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('Madam Gwen')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('CompSci')
    expect(page).to have_content('Engineering')
    expect(page).to have_content('Junior')
	
	visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'DROP TABLE universities;'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'DROP TABLE foreign_courses;'
	fill_in 'foreign_course_foreign_course_num', with: 5
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('DROP TABLE universities;')
    expect(page).to have_content('3')
    expect(page).to have_content('DROP TABLE foreign_courses')
    expect(page).to have_content('5')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
	
    visit universities_path
	expect(page).to have_content('United Kingdom')
	
	visit new_foreign_courses_student_path
	select 'Madam Gwen', :from => 'foreign_courses_student_student_id'
    select 'DROP TABLE universities;', :from => 'foreign_courses_student_foreign_course_id'
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('3')
    expect(page).to have_content('Fall 2020')
    expect(page).to have_content('431')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
	
	visit new_foreign_courses_tamu_course_path
	select 'Software Engineering', :from => 'foreign_courses_tamu_course_tamu_course_id'
	select 'Software Engineering', :from => 'foreign_courses_tamu_course_foreign_course_id'
  end
  
  scenario 'Data still exists after SQL Injection attempt' do
	visit new_university_path
    fill_in 'university_city_country', with: 'London, United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
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
	
    visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'Software Engineering'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
    expect(page).to have_content('Oxford')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('3')
    expect(page).to have_content('Fall 2020')
    expect(page).to have_content('431')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
  
	visit new_foreign_course_path
	fill_in 'foreign_course_foreign_course_name', with: 'DROP TABLE foreign_courses;'
	fill_in 'foreign_course_contact_hours', with: 3
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_foreign_course_num', with: '431'
	fill_in 'foreign_course_foreign_course_dept', with: 'CSCE'
	check 'foreign_course_course_approval_status'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Hacker', :from => 'foreign_course_university_id'
    page.attach_file('foreign_course_syllabus', "spec/test_files/test_syllabus.pdf")
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('DROP TABLE foreign_courses;')
    expect(page).to have_content('Hacker')
    expect(page).to have_content('Software Engineering')
    expect(page).to have_content('3')
    expect(page).to have_content('Fall 2020')
    expect(page).to have_content('431')
    expect(page).to have_content('CSCE')
    expect(page).to have_content('true')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'Software Engineering'
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
	
	  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 431
    fill_in 'tamu_course_course_name', with: 'DROP TABLE tamu_courses;'
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('DROP TABLE tamu_courses;')
	
	visit new_foreign_courses_tamu_course_path
	select 'Software Engineering', :from => 'foreign_courses_tamu_course_tamu_course_id'
	select 'Software Engineering', :from => 'foreign_courses_tamu_course_foreign_course_id'
	click_on 'Create Foreign courses tamu course'
	visit foreign_courses_tamu_courses_path
	expect(page).to have_content('Software Engineering')
	
	
  end
end
