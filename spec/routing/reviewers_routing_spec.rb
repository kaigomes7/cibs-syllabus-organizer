require "rails_helper"

RSpec.describe ReviewersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reviewers").to route_to("reviewers#index")
    end

    it "routes to #new" do
      expect(get: "/reviewers/new").to route_to("reviewers#new")
    end

    it "routes to #show" do
      expect(get: "/reviewers/1").to route_to("reviewers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/reviewers/1/edit").to route_to("reviewers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/reviewers").to route_to("reviewers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/reviewers/1").to route_to("reviewers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reviewers/1").to route_to("reviewers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/reviewers/1").to route_to("reviewers#destroy", id: "1")
    end
  end
end
