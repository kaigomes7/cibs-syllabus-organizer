bundle install

rails g scaffold foreign_courses instrutor:string tamu_department_id:integer foreign_course_name:string credit_hours:integer university_id:integer semester_approved:string
rails g scaffold students student_email:string tamu_department_id:integer student_name:string
rails g scaffold tamu_courses tamu_department_id:integer course_num:integer
rails g scaffold universities country:string university_name:string
rails g scaffold tamu_departments tamu_department_name:string
rails g scaffold reviewers reviewer_email:string tamu_department_id:integer
rails g scaffold courses_students student_id:integer course_id:integer
rails g scaffold foreign_courses_tamu_courses foreign_course_id:integer tamu_course_id:integer

rails db:create
rails db:migrate