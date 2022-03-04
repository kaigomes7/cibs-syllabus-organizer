rails g scaffold universities city_country:string university_name:string
rails g scaffold tamu_departments tamu_department_name:string
rails g scaffold users email:string name:string role:integer
rails g scaffold admins user:references
rails g scaffold reviewers user:references tamu_department:references
rails g scaffold students user:references tamu_department:references tamu_major:string tamu_college:string classification:string
rails g scaffold tamu_courses tamu_department:references course_num:integer course_name:string
rails g scaffold foreign_courses tamu_department_id:integer:index foreign_course_name:string contact_hours:integer semester_approved:string foreign_course_dept:string foreign_course_num:integer course_approval_status:boolean
rails g scaffold foreign_courses_tamu_courses tamu_course:references foreign_course:references
rails g scaffold foreign_courses_students foreign_course:references student:references admin_course_approval:boolean start_date:date end_date:date