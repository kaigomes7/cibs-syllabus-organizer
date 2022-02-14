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

=begin
RSpec.describe 'Creating a TAMU Course', type: :feature do
  scenario 'valid inputs' do
	visit new_tamu_department_path
    fill_in 'tamu_department_tamu_department_name', with: 'CSCE'
    click_on 'Create Tamu department'
    visit tamu_departments_path
    expect(page).to have_content('CSCE')
  
    visit new_tamu_course_path
    fill_in 'tamu_course_course_num', with: 5
    fill_in 'tamu_course_tamu_department_id', with: 1
    click_on 'Create Tamu course'
    visit tamu_courses_path
    expect(page).to have_content('1')
  end
end	



RSpec.describe 'Creating a foreign course', type: :feature do
  scenario 'valid inputs' do
    visit new_foreign_course_path
    fill_in 'Instrutor', with: 'harry potter'
	fill_in 'foreign_course_foreign_course_name', with: 'Design Algo'
	fill_in 'foreign_course_credit_hours', with: 10
	fill_in 'foreign_course_semester_approved', with: 'Fall 2020'
	fill_in 'foreign_course_tamu_department_id', with: 10
    click_on 'Create Foreign course'
    visit foreign_courses_path
    expect(page).to have_content('harry potter')
  end
end	

=end