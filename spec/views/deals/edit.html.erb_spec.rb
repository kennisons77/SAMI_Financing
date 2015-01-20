require 'rails_helper'

RSpec.describe "deals/edit", :type => :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :collateral => "MyString",
      :term => "MyString"
    ))
  end

  it "renders the edit deal form" do
    render

    assert_select "form[action=?][method=?]", deal_path(@deal), "post" do

      assert_select "input#deal_collateral[name=?]", "deal[collateral]"

      assert_select "input#deal_term[name=?]", "deal[term]"
    end
  end
end
