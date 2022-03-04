require "rails_helper"

RSpec.describe TamuDepartmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tamu_departments").to route_to("tamu_departments#index")
    end

    it "routes to #new" do
      expect(get: "/tamu_departments/new").to route_to("tamu_departments#new")
    end

    it "routes to #show" do
      expect(get: "/tamu_departments/1").to route_to("tamu_departments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tamu_departments/1/edit").to route_to("tamu_departments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tamu_departments").to route_to("tamu_departments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tamu_departments/1").to route_to("tamu_departments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tamu_departments/1").to route_to("tamu_departments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tamu_departments/1").to route_to("tamu_departments#destroy", id: "1")
    end
  end
end
