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
end	

RSpec.describe 'Creating an admin/Expect Name', type: :feature do
  scenario 'valid inputs' do
    visit new_admin_path
    fill_in 'admin_name', with: 'Sir Jake'
    fill_in 'admin_email', with: 'jake@camelot.com'
    click_on 'Create Admin'
    visit admins_path
    expect(page).to have_content('Sir Jake')
  end
end	


RSpec.describe 'Creating an admin/Expect Email', type: :feature do
  scenario 'valid inputs' do
    visit new_admin_path
    fill_in 'admin_name', with: 'Sir Jake'
    fill_in 'admin_email', with: 'jake@camelot.com'
    click_on 'Create Admin'
    visit admins_path
	expect(page).to have_content('jake@camelot.com')
  end
end	

RSpec.describe 'Creating a University/Expect Country', type: :feature do
  scenario 'valid inputs' do
    visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
  end
end	

RSpec.describe 'Creating a University/Expect University Name', type: :feature do
  scenario 'valid inputs' do
    visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('Oxford')
  end
end	


RSpec.describe 'Creating a TAMU Course/Expect Department Name', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 5
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
  end
end	

RSpec.describe 'Creating a student/Expect Email', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
    fill_in 'student_student_email', with: 'jodie@gmail.com'
	fill_in 'student_student_name', with: 'jodie'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('jodie@gmail.com')
  end
end	

RSpec.describe 'Creating a student/Expect Name', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
    fill_in 'student_student_email', with: 'jodie@gmail.com'
	fill_in 'student_student_name', with: 'jodie'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('jodie')
  end
end	

RSpec.describe 'Creating a student/Expect Department', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
    fill_in 'student_student_email', with: 'jodie@gmail.com'
	fill_in 'student_student_name', with: 'jodie'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('CSCE')
  end
end	

RSpec.describe 'Creating a reviewer/Expect email', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_reviewer_path
    fill_in 'reviewer_reviewer_email', with: 'jodie@gmail.com'
    select 'CSCE', :from => 'reviewer_tamu_department_id'
    click_on 'Create Review'
    visit reviewers_path
    expect(page).to have_content('jodie@gmail.com')
  end
end	

RSpec.describe 'Creating a reviewer/Expect Department', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_reviewer_path
    fill_in 'reviewer_reviewer_email', with: 'jodie@gmail.com'
    select 'CSCE', :from => 'reviewer_tamu_department_id'
    click_on 'Create Review'
    visit reviewers_path
    expect(page).to have_content('CSCE')
  end
end	

RSpec.describe 'Creating a foreign course/Expect Instructor', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
  end
end	

RSpec.describe 'Creating a foreign course/Expect Foreign Course Name', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('Design Algo')
  end
end	

RSpec.describe 'Creating a foreign course/Expect Credit Hours', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('10')
  end
end


RSpec.describe 'Creating a foreign course/Expect Semester Approved', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('10')
  end
end	

RSpec.describe 'Creating a foreign course/Expect Tamu Department', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('CSCE')
  end
end	

RSpec.describe 'Creating a foreign course/Expect University ID', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('Oxford')
  end
end	

RSpec.describe 'Creating a foreign course tamu course entry/Expect Department', type: :feature do
  scenario 'valid inputs' do
	  visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	  visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	  fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	  fill_in 'foreign_course_credit_hours', with: 10
	  fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 5
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
  end
end

RSpec.describe 'Creating a foreign course tamu course entry/Expect Course Number', type: :feature do
  scenario 'valid inputs' do
	  visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
	
	  visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	  fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	  fill_in 'foreign_course_credit_hours', with: 10
	  fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 5
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('5')
  end
end


RSpec.describe 'Creating a course/student relation', type: :feature do
  scenario 'valid inputs' do
	
	  visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
    fill_in 'student_student_email', with: 'jodie@gmail.com'
	  fill_in 'student_student_name', with: 'jodie'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('jodie')
	
	  visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	  fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	  fill_in 'foreign_course_credit_hours', with: 10
	  fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
	
	  visit new_foreign_courses_student_path
	  select 'jodie', :from => 'foreign_courses_student_student_id'
	  select 'Design Algo', :from => 'foreign_courses_student_foreign_course_id'
	  click_on 'Create Foreign courses student'
	  visit foreign_courses_students_path
    expect(page).to have_content('Design Algo')
	
  end
end	

RSpec.describe 'Creating a course/student relation/Expect Foreign Courses Student Foreign Course ID', type: :feature do
  scenario 'valid inputs' do
	
	  visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
    fill_in 'student_student_email', with: 'jodie@gmail.com'
	  fill_in 'student_student_name', with: 'jodie'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('jodie')
	
	  visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	  fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	  fill_in 'foreign_course_credit_hours', with: 10
	  fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
	
    visit new_foreign_courses_student_path
    select 'jodie', :from => 'foreign_courses_student_student_id'
    select 'Design Algo', :from => 'foreign_courses_student_foreign_course_id'
    click_on 'Create Foreign courses student'
    visit foreign_courses_students_path
    expect(page).to have_content('Design Algo')
	
  end
end	

RSpec.describe 'Creating a course/student relation/Expect Student ID', type: :feature do
  scenario 'valid inputs' do
	
	  visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_student_path
    fill_in 'student_student_email', with: 'jodie@gmail.com'
	  fill_in 'student_student_name', with: 'jodie'
    select 'CSCE', :from => 'student_tamu_department_id'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('jodie')
	
	  visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
	
    visit new_foreign_course_path
    fill_in 'Instructor', with: 'harry potter'
	  fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	  fill_in 'foreign_course_credit_hours', with: 10
	  fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
	
	  visit new_foreign_courses_student_path
	  select 'jodie', :from => 'foreign_courses_student_student_id'
	  select 'Design Algo', :from => 'foreign_courses_student_foreign_course_id'
	  click_on 'Create Foreign courses student'
	  visit foreign_courses_students_path
    expect(page).to have_content('jodie')
	
  end
end	