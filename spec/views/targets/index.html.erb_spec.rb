require 'rails_helper'

RSpec.describe "targets/index", :type => :view do
  before(:each) do
    assign(:targets, [
      Target.create!(
        :amount => "9.99",
        :yield => "9.99",
        :borrower => nil,
        :deal => nil
      ),
      Target.create!(
        :amount => "9.99",
        :yield => "9.99",
        :borrower => nil,
        :deal => nil
      )
    ])
  end

  it "renders a list of targets" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
