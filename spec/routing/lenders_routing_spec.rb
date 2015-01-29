require "rails_helper"

RSpec.describe LendersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lenders").to route_to("lenders#index")
    end

    it "routes to #new" do
      expect(:get => "/lenders/new").to route_to("lenders#new")
    end

    it "routes to #show" do
      expect(:get => "/lenders/1").to route_to("lenders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lenders/1/edit").to route_to("lenders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lenders").to route_to("lenders#create")
    end

    it "routes to #update" do
      expect(:put => "/lenders/1").to route_to("lenders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lenders/1").to route_to("lenders#destroy", :id => "1")
    end

  end
end
