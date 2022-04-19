# frozen_string_literal: true

class ApplicationController < ActionController::Base
  file = open('backup/majors.csv')
  $majors = file.readlines.map(&:chomp)
  file.close
  # url = 'https://www.tamu.edu/about/departments.html'
  # unparsed_page = HTTParty.get(url)
  # parsed_page = Nokogiri::HTML(unparsed_page.body)
  # $colleges = parsed_page.xpath('/html/body/div/main/section').map { |x| x.text[/(?<=\n\n\n\n\n)(.*)(?=\n\n\n\n)/] }.compact
  college_file = open('backup/colleges.csv')
  $colleges = college_file.readlines.map(&:chomp)
  college_file.close
  before_action :authenticate_user!

  def reviewer?
    User.find_by_id(current_user.id).role == 2
  end

  def admin?
    User.find_by_id(current_user.id).role.zero?
  end

  def student?
    User.find_by_id(current_user.id).role == 1
  end
end
