class AllRequestsController < ApplicationController
  def index
    @foreign_courses = ForeignCourse.all
  end   
end
