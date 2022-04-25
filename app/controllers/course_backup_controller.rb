class CourseBackupController < ApplicationController
    def index
        if !(admin? || current_user.role.zero?)
            redirect_to root_url, alert: 'You must be an admin to view that page, contact administrator if you believe this an error'
        end
    end

    def backup
        if !(admin? || current_user.role.zero?)
            redirect_to root_url, alert: 'You must be an admin to view that page, contact administrator if you believe this an error'
        end
        csv_file_types = ['text/comma-separated-values', 'text/csv', 'application/csv',
            'application/excel', 'application/vnd.ms-excel', 'application/vnd.msexcel']

        depts_file = course_backup_params[:department_backup_file]
        courses_file = course_backup_params[:course_backup_file]
        majors_file = course_backup_params[:majors_backup_file]
        colleges_file = course_backup_params[:colleges_backup_file]

        if !depts_file.nil? && depts_file.content_type().in?(csv_file_types) then add_backup_departments(depts_file) end
        if !courses_file.nil? && courses_file.content_type().in?(csv_file_types) then add_backup_courses(courses_file) end
        if !majors_file.nil? && majors_file.content_type().in?(csv_file_types) then add_backup_majors(majors_file) end
        if !colleges_file.nil? && colleges_file.content_type().in?(csv_file_types) then add_backup_colleges(colleges_file) end

        # Commented out because can't handle non- utf-8 characters
        # universities_file = course_backup_params[:universites_backup_file]
        # if !universities_file.nil? && universities_file.content_type().in?(csv_file_types) then add_backup_universities(universities_file) end

        redirect_to root_path
    end

    def seeding
        redirect_to root_path if current_user.role == 1
        redirect_to syllabi_reviewer_url if current_user.role == 2
        begin
            Rails.application.load_seed
        rescue
            redirect_to course_backup_path, alert: "Unable to re-seed database, please use CSV backup, see help page for more details."
        end
    end

    private
    def add_backup_departments(depts_file)
        current_depts = TamuDepartment.all.map(&:tamu_department_name)
        backup_depts = depts_file.read.split("\n")
        new_departments = backup_depts - current_depts
        new_departments_added = new_departments.map {|d| {'tamu_department_name': d}}
        TamuDepartment.create(new_departments_added)
        if TamuDepartment.count > current_depts.length()
            flash[:sucess] = "Added departments: #{new_departments.join(", ")}"
        end
    end

    def add_backup_courses(courses_file)
        current_courses = TamuCourse.all.order("course_name").map(&:course_name)
        backup_courses = courses_file.read.split("\n").map {|c| c.gsub(",", " ")}
        new_courses = backup_courses - current_courses
        # Maps department name to department_id
        current_depts_map = Hash[*TamuDepartment.all.map {|d| [d.tamu_department_name, d.id]}.flatten(1)]
        new_courses_added = []
        new_courses.each do |course|
            temp_course = course.split(" ")
            dept = temp_course[0]
            if current_depts_map.key?(dept)
                new_courses_added << {'tamu_department_id': current_depts_map[dept], 'course_num': temp_course[1], 'course_name': "#{dept} #{temp_course[1]}"}
            end
        end
        TamuCourse.create!(new_courses_added)
        if TamuCourse.count > current_courses.length()
            flash[:success] = "Added courses: #{new_courses_added.map{|nc| nc[:course_name]}.join(", ")}"
        end
    end

    # Can't handle non-utf-8 characters properly
    # def add_backup_universities(universities_file)
    #     current_universities_names = University.all.map(&:university_name)
    #     backup_unis = CSV.parse(universities_file.read)
    #     backup_unis_names = backup_unis.map {|u| u[0]}
    #     new_universities_names = backup_unis_names.map(&:strip) - current_universities_names.map(&:strip)
    #     new_universities = backup_unis.select { |uni| uni[0].strip.in? new_universities_names }
    #     University.create!(new_universities)
    #     if University.count > current_universities_names.length()
    #         flash[:sucess] = "Added departments: #{new_universities.join(" | ")}"
    #     end
    # end

    def add_backup_majors(majors_file)
        File.open(Rails.root.join('backup', 'majors.csv'), 'w') do |file|
            file.write(majors_file.read)
        end
        file = open('backup/majors.csv')
        $majors = file.readlines.map(&:chomp)
        file.close
    end

    def add_backup_colleges(colleges_file)
        File.open(Rails.root.join('backup', 'colleges.csv'), 'w') do |file|
            file.write(colleges_file.read)
        end
        file = open('backup/colleges.csv')
        $colleges = file.readlines.map(&:chomp)
        file.close()
    end

    # Only allow a list of trusted parameters through.
    def course_backup_params
        params.permit(:course_backup_file,
            :authenticity_token, :commit, :department_backup_file,
            # :universites_backup_file,
            :majors_backup_file, :colleges_backup_file)
    end
    
end
