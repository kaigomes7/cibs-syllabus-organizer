# location: spec/feature/integration_spec.rb
require 'rails_helper'


RSpec.describe 'Creating an Admin', type: :feature do
  scenario 'valid inputs' do
    visit new_admin_path
    fill_in 'admin_name', with: 'Arthur'
    fill_in 'admin_email', with: 'arthur@camelot.com'
    click_on 'Create Admin'
    visit admins_path
    expect(page).to have_content('Arthur')
    expect(page).to have_content('arthur@camelot.com')
  end
end	

RSpec.describe 'Creating a tamu department', type: :feature do
  scenario 'valid inputs' do
    visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  end
end	

RSpec.describe 'Creating a University', type: :feature do
  scenario 'valid inputs' do
    visit new_university_path
    fill_in 'university_country', with: 'United Kingdom'
    fill_in 'university_university_name', with: 'Oxford'
    click_on 'Create University'
    visit universities_path
    expect(page).to have_content('United Kingdom')
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
    fill_in 'tamu_course_course_num', with: 5
    select 'CSCE', :from => 'tamu_course_tamu_department_id'
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('CSCE')
  end
end	

RSpec.describe 'Creating a student', type: :feature do
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

RSpec.describe 'Creating a reviewer', type: :feature do
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

RSpec.describe 'Creating a foreign course', type: :feature do
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
    fill_in 'Instrutor', with: 'harry potter'
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

=begin
RSpec.describe 'Creating a foreign course tamu course entry', type: :feature do
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
    fill_in 'Instrutor', with: 'harry potter'
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
=end

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
    fill_in 'Instrutor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
    select 'CSCE', :from => 'foreign_course_tamu_department_id'
    select 'Oxford', :from => 'foreign_course_university_id'
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
	
	visit new_courses_student_path
	select 'jodie', :from => 'courses_student_student_id'
	select 'Design Algo', :from => 'courses_student_foreign_course_id'
	click_on 'Create Courses student'
	visit courses_students_path
    expect(page).to have_content('Design Algo')
	
	
  end
end	