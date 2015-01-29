require 'rails_helper'

RSpec.describe "Agreements", :type => :request do
  describe "GET /agreements" do
    it "works! (now write some real specs)" do
      get agreements_path
      expect(response).to have_http_status(200)
    end
  end
end
