rails g scaffold universities city_country:string university_name:string
rails g scaffold tamu_departments tamu_department_name:string
rails g scaffold users email:string name:string role:integer
rails g scaffold admins user:references
rails g scaffold reviewers tamu_department:references user:references
rails g scaffold students tamu_department:references user:references tamu_major:string tamu_college:string classification:string
rails g scaffold tamu_courses course_num:integer tamu_department:references course_name:string
rails g scaffold foreign_courses foreign_course_name:string contact_hours:integer semester_approved:string tamu_department:references university:references foreign_course_num:integer foreign_course_dept:string course_approval_status:boolean
rails g scaffold foreign_courses_tamu_courses foreign_course:references tamu_course:references
rails g scaffold foreign_courses_students student:references foreign_course:references admin_course_approval:boolean start_date:date end_date:date