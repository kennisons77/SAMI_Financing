require 'rails_helper'

RSpec.describe "deals/new", :type => :view do
  before(:each) do
    assign(:deal, Deal.new(
      :collateral => "MyString",
      :term => "MyString"
    ))
  end

  it "renders new deal form" do
    render

    assert_select "form[action=?][method=?]", deals_path, "post" do

      assert_select "input#deal_collateral[name=?]", "deal[collateral]"

      assert_select "input#deal_term[name=?]", "deal[term]"
    end
  end
end
