# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'thread'

def fetch_departments
    url = "https://catalog.tamu.edu/undergraduate/course-descriptions/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    depts_index = parsed_page.css('[id="atozindex"]')
    return depts_index.css('li/a').map {|dept| dept.text[/\((.*)?\)/, 1]}
end

def fetch_courses (url)
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    return parsed_page.css('div[@class="courseblock"]/p[@class="courseblocktitle noindent"]').map {|course| course.text[/([0-9]+)/].to_i}
end

def tamu_department_scraper
    depts = fetch_departments.map {|dept| {"tamu_department_name": dept}}
    # puts depts
end

def tamu_course_scraper
    depts = fetch_departments
    threads = []
    tamu_course_objects = []
    tamu_course_objects_mutex = Mutex.new
    depts.each do |dept|
        url = "https://catalog.tamu.edu/undergraduate/course-descriptions/#{dept.downcase}"
        threads << Thread.new(url, tags) do |url, tamu_course_objects|
            tamu_course = fetch_courses(url).map {|course_num| {'tamu_department_id': dept, 'course_num': course_num} }
            tamu_course_objects.synchronize { tamu_course_objects << tamu_course }
        end
    end
    threads.each(&:join)
    # puts tamu_course_objects
end

def foreign_university_parser
    url = "https://mays.tamu.edu/center-for-international-business-studies/exchange-partners/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    foreign_universities = []
    rows = parsed_page.css('table').css('tr')
    rows.drop(1).each do |row|
        foreign_universities << {
            "university_name": row.css('td')[0].text,
            # "city": row.css('td')[1].text
            "country": row.css('td')[2].text
        }
    end
    # puts foreign_universities
end

tamu_department_scraper
