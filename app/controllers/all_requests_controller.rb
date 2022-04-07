# frozen_string_literal: true

class AllRequestsController < ApplicationController
  def index
    @foreign_courses = ForeignCourse.all
  end
end
