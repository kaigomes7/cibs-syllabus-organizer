# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'httparty'
require 'thread'

THREAD_COUNT = 15

def fetch_departments
    url = "https://catalog.tamu.edu/undergraduate/course-descriptions/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    depts_index = parsed_page.css('[id="atozindex"]') # Gets all departments
    return depts_index.css('li/a').map {|dept| dept.text[/\((.*)?\)/, 1]}
end

def fetch_courses (url)
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    return parsed_page.css('div[@class="courseblock"]/p[@class="courseblocktitle noindent"]').map {|course| course.text[/([0-9]+)/].to_i}
end

def tamu_department_scraper
    depts = fetch_departments.map {|dept| {"tamu_department_name": dept}}
    return depts
end

def tamu_course_scraper
    depts = fetch_departments
    threads = []
    tamu_course_objects = []
    tamu_course_objects_mutex = Mutex.new
    urls = depts.map {|dept| "https://catalog.tamu.edu/undergraduate/course-descriptions/#{dept.downcase}"}
    tamu_department_name_to_id_map = {}
    TamuDepartment.find_each do |dept| 
        tamu_department_name_to_id_map["#{dept.tamu_department_name}"] =  dept.id
    end
    THREAD_COUNT.times.map {
        Thread.new(urls, tamu_course_objects) do |urls, tamu_course_objects|
            while url = tamu_course_objects_mutex.synchronize { urls.pop }
                dept_name = url[url.length-4, url.length].upcase
                tamu_course = fetch_courses(url).map {|course_num| {'tamu_department_id': tamu_department_name_to_id_map[dept_name], 'course_num': course_num, 'course_name': dept_name + ' ' + course_num.to_s} }
                tamu_course_objects_mutex.synchronize { tamu_course_objects << tamu_course }
            end
        end
    }.each(&:join)
    return tamu_course_objects
end

def foreign_university_scraper
    url = "https://mays.tamu.edu/center-for-international-business-studies/exchange-partners/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    foreign_universities = []
    rows = parsed_page.css('table').css('tr')
    rows.drop(1).each do |row|
        foreign_universities << {
            "university_name": row.css('td')[0].text,
            "city_country": row.css('td')[1].text + ','+ row.css('td')[2].text
        }
    end
    return foreign_universities
end

def seed_tamu_departments
    TamuDepartment.create!(tamu_department_scraper)
end

def seed_tamu_courses
    TamuCourse.create!(tamu_course_scraper)
end

def seed_foreign_universities
    University.create!(foreign_university_scraper)
end

TamuCourse.destroy_all
TamuDepartment.destroy_all
University.destroy_all

start = Time.now
seed_tamu_departments
seed_foreign_universities
seed_tamu_courses
puts "Elapsed Time: #{start - Time.now}"

User.create(name: 'Admin', role: 0, email: 'vitruong00@tamu.edu', 
uid: 102096633092126286523) if User.find_by(uid: 102096633092126286523).nil?

# Admin.create(user_id: 1)

User.create(name: 'Zachary Lawton Admin', role: 0, email: 'zlaw627@tamu.edu', 
uid: 100957211544407556230) if User.find_by(uid: 100957211544407556230).nil?

# Admin.create(user_id: 2)