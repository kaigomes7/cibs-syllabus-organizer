require "rails_helper"

RSpec.describe TamuCoursesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tamu_courses").to route_to("tamu_courses#index")
    end

    it "routes to #new" do
      expect(get: "/tamu_courses/new").to route_to("tamu_courses#new")
    end

    it "routes to #show" do
      expect(get: "/tamu_courses/1").to route_to("tamu_courses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tamu_courses/1/edit").to route_to("tamu_courses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tamu_courses").to route_to("tamu_courses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tamu_courses/1").to route_to("tamu_courses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tamu_courses/1").to route_to("tamu_courses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tamu_courses/1").to route_to("tamu_courses#destroy", id: "1")
    end
  end
end
