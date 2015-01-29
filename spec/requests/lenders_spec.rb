require 'rails_helper'

RSpec.describe "Lenders", :type => :request do
  describe "GET /lenders" do
    it "works! (now write some real specs)" do
      get lenders_path
      expect(response).to have_http_status(200)
    end
  end
end
