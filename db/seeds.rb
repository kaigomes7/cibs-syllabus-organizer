# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TamuDepartment.create(tamu_department_name: "FINC")
University.create(university_name: "Monster's University", city_country: "Moon")
User.create(email: "js@js.com", name: "jon smith")
Student.create(user_id: 1, tamu_department_id: 1, tamu_major: 'CSCE', tamu_college: 'Engineering', classification: 'Senior')
TamuCourse.create(tamu_department_id: 1, course_num: 143, course_name: 'FINC 143')
ForeignCourse.create(tamu_department_id: 1, foreign_course_name: 'Intro to Finance', contact_hours: 45, university_id: 1, semester_approved: 'Spring 2020', course_approval_status: false, foreign_course_dept: 'FNCC', foreign_course_num: '1234')
ForeignCoursesStudent.create(student_id: 1, )