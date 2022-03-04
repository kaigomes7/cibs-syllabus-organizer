require "rails_helper"

RSpec.describe ForeignCoursesTamuCoursesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/foreign_courses_tamu_courses").to route_to("foreign_courses_tamu_courses#index")
    end

    it "routes to #new" do
      expect(get: "/foreign_courses_tamu_courses/new").to route_to("foreign_courses_tamu_courses#new")
    end

    it "routes to #show" do
      expect(get: "/foreign_courses_tamu_courses/1").to route_to("foreign_courses_tamu_courses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/foreign_courses_tamu_courses/1/edit").to route_to("foreign_courses_tamu_courses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/foreign_courses_tamu_courses").to route_to("foreign_courses_tamu_courses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/foreign_courses_tamu_courses/1").to route_to("foreign_courses_tamu_courses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/foreign_courses_tamu_courses/1").to route_to("foreign_courses_tamu_courses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/foreign_courses_tamu_courses/1").to route_to("foreign_courses_tamu_courses#destroy", id: "1")
    end
  end
end
