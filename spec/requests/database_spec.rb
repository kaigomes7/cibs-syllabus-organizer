require 'rails_helper'

RSpec.describe "Databases", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/database/index"
      expect(response).to have_http_status(:success)
    end
  end

end
