require "rails_helper"

RSpec.describe SignersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/signers").to route_to("signers#index")
    end

    it "routes to #new" do
      expect(:get => "/signers/new").to route_to("signers#new")
    end

    it "routes to #show" do
      expect(:get => "/signers/1").to route_to("signers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/signers/1/edit").to route_to("signers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/signers").to route_to("signers#create")
    end

    it "routes to #update" do
      expect(:put => "/signers/1").to route_to("signers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/signers/1").to route_to("signers#destroy", :id => "1")
    end

  end
end
