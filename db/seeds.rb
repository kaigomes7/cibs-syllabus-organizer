# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'httparty'
THREAD_COUNT = 15

def fetch_departments
  url = 'https://catalog.tamu.edu/undergraduate/course-descriptions/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)
  depts_index = parsed_page.css('[id="atozindex"]') # Gets all departments
  depts_index.css('li/a').map { |dept| dept.text[/\((.*)?\)/, 1] }
end

def fetch_courses(url)
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)
  parsed_page.css('div[@class="courseblock"]/p[@class="courseblocktitle noindent"]').map do |course|
    course.text[/([0-9]+)/].to_i
  end
end

def tamu_department_scraper
  fetch_departments.map { |dept| { tamu_department_name: dept } }
end

def tamu_course_scraper
  depts = TamuDepartment.all
  tamu_course_objects = []
  tamu_course_objects_mutex = Mutex.new
  urls = depts.map { |dept| "https://catalog.tamu.edu/undergraduate/course-descriptions/#{dept.tamu_department_name.downcase}" }
  tamu_department_name_to_id_map = depts.to_h { |dept| [dept.tamu_department_name, dept.id] }
  THREAD_COUNT.times.map do
    Thread.new(urls, tamu_course_objects) do |url_s, _tamu_course_object_s|
      while (url = tamu_course_objects_mutex.synchronize { url_s.pop })
        dept_name = url[url.length - 4, url.length].upcase
        tamu_course = fetch_courses(url).map do |course_num|
          { tamu_department_id: tamu_department_name_to_id_map[dept_name], course_num: course_num,
            course_name: "#{dept_name} #{course_num}" }
        end
        tamu_course_objects_mutex.synchronize { tamu_course_objects << tamu_course }
      end
    end
  end.each(&:join)
  tamu_course_objects
end

def foreign_university_scraper
  url = 'https://mays.tamu.edu/center-for-international-business-studies/exchange-partners/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)
  foreign_universities = []
  rows = parsed_page.css('table').css('tr')
  rows.drop(1).each do |row|
    foreign_universities << {
      university_name: row.css('td')[0].text,
      city_country: "#{row.css('td')[1].text},#{row.css('td')[2].text}"
    }
  end
  foreign_universities
end

def seed_db
  # Get new departments added to TAMU and seed database with them
  current_depts_names = TamuDepartment.all.map(&:tamu_department_name)
  web_departments = tamu_department_scraper
  web_departments_names = web_departments.map { |x| x[:tamu_department_name] }
  new_department_names = web_departments_names - current_depts_names
  new_departments = web_departments.select { |dept| dept[:tamu_department_name].in? new_department_names }
  TamuDepartment.create!(new_departments)
  TamuDepartment.create!(tamu_department_name: 'Unassigned') if TamuDepartment.find_by(tamu_department_name: 'Unassigned').nil?

  current_course_names = TamuCourse.all.map(&:course_name)
  web_courses = tamu_course_scraper.flatten
  web_course_names = web_courses.map { |x| x[:course_name] }
  new_courses_names = web_course_names - current_course_names
  new_courses = web_courses.select { |course| course[:course_name].in? new_courses_names }
  TamuCourse.create!(new_courses)

  current_universities_names = University.all.map(&:university_name)
  web_universites = foreign_university_scraper
  web_universites_names = web_universites.map { |x| x[:university_name] }
  new_universities_names = web_universites_names - current_universities_names
  new_universities = web_universites.select { |uni| uni[:university_name].in? new_universities_names }
  University.create!(new_universities)
end

start = Time.now
seed_db

puts "Elapsed Time: #{Time.now - start}"

if User.find_by(uid: 102_096_633_092_126_286_523).nil?
  User.create(name: 'Admin', role: 0, email: 'vitruong00@tamu.edu',
              uid: 102_096_633_092_126_286_523)
end

if User.find_by(uid: 102_096_633_092_126_286_523).nil?
  User.create(name: 'Admin', role: 0, email: 'vitruong00@tamu.edu',
              uid: 102_096_633_092_126_286_523)
end

if User.find_by(uid: 100_957_211_544_407_556_230).nil?
  User.create(name: 'Zach Admin', role: 0, email: 'zlaw627@tamu.edu',
              uid: 100_957_211_544_407_556_230)
end

if User.find_by(uid: 107_625_687_433_550_085_289).nil?
  User.create(name: 'Zach Reviewer', role: 2, email: 'zacharyslawton@gmail.com',
              uid: 107_625_687_433_550_085_289)
end
