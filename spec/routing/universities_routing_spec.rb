require "rails_helper"

RSpec.describe UniversitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/universities").to route_to("universities#index")
    end

    it "routes to #new" do
      expect(get: "/universities/new").to route_to("universities#new")
    end

    it "routes to #show" do
      expect(get: "/universities/1").to route_to("universities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/universities/1/edit").to route_to("universities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/universities").to route_to("universities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/universities/1").to route_to("universities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/universities/1").to route_to("universities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/universities/1").to route_to("universities#destroy", id: "1")
    end
  end
end
