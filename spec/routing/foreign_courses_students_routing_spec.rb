require "rails_helper"

RSpec.describe ForeignCoursesStudentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/foreign_courses_students").to route_to("foreign_courses_students#index")
    end

    it "routes to #new" do
      expect(get: "/foreign_courses_students/new").to route_to("foreign_courses_students#new")
    end

    it "routes to #show" do
      expect(get: "/foreign_courses_students/1").to route_to("foreign_courses_students#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/foreign_courses_students/1/edit").to route_to("foreign_courses_students#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/foreign_courses_students").to route_to("foreign_courses_students#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/foreign_courses_students/1").to route_to("foreign_courses_students#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/foreign_courses_students/1").to route_to("foreign_courses_students#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/foreign_courses_students/1").to route_to("foreign_courses_students#destroy", id: "1")
    end
  end
end
