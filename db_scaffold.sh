rails g scaffold foreign_course instrutor:string tamu_department:belongs_to foreign_course_name:string credit_hours:integer university:belongs_to semester_approved:string
rails g scaffold student student_email:string tamu_department:belongs_to student_name:string
rails g scaffold tamu_course tamu_department:belongs_to course_num:integer
rails g scaffold university country:string university_name:string
rails g scaffold tamu_department tamu_department_name:string
rails g scaffold reviewer reviewer_email:string tamu_department:belongs_to
rails g scaffold courses_student student:belongs_to course:belongs_to
rails g scaffold foreign_courses_tamu_course foreign_course:belongs_to tamu_course:belongs_to

rails db:create
rails db:migrate