require 'rails_helper'

RSpec.describe "Signers", :type => :request do
  describe "GET /signers" do
    it "works! (now write some real specs)" do
      get signers_path
      expect(response).to have_http_status(200)
    end
  end
end
