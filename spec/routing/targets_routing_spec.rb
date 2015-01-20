require "rails_helper"

RSpec.describe TargetsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/targets").to route_to("targets#index")
    end

    it "routes to #new" do
      expect(:get => "/targets/new").to route_to("targets#new")
    end

    it "routes to #show" do
      expect(:get => "/targets/1").to route_to("targets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/targets/1/edit").to route_to("targets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/targets").to route_to("targets#create")
    end

    it "routes to #update" do
      expect(:put => "/targets/1").to route_to("targets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/targets/1").to route_to("targets#destroy", :id => "1")
    end

  end
end
