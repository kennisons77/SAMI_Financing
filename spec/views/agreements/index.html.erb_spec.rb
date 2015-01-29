require 'rails_helper'

RSpec.describe "agreements/index", :type => :view do
  before(:each) do
    assign(:agreements, [
      Agreement.create!(
        :amount => "9.99",
        :fulfilled => "9.99",
        :lender => nil,
        :target => nil
      ),
      Agreement.create!(
        :amount => "9.99",
        :fulfilled => "9.99",
        :lender => nil,
        :target => nil
      )
    ])
  end

  it "renders a list of agreements" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
