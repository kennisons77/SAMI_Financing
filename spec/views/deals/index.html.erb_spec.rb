require 'rails_helper'

RSpec.describe "deals/index", :type => :view do
  before(:each) do
    assign(:deals, [
      Deal.create!(
        :collateral => "Collateral",
        :term => "Term"
      ),
      Deal.create!(
        :collateral => "Collateral",
        :term => "Term"
      )
    ])
  end

  it "renders a list of deals" do
    render
    assert_select "tr>td", :text => "Collateral".to_s, :count => 2
    assert_select "tr>td", :text => "Term".to_s, :count => 2
  end
end
