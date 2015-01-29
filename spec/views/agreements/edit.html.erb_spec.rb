require 'rails_helper'

RSpec.describe "agreements/edit", :type => :view do
  before(:each) do
    @agreement = assign(:agreement, Agreement.create!(
      :amount => "9.99",
      :fulfilled => "9.99",
      :lender => nil,
      :target => nil
    ))
  end

  it "renders the edit agreement form" do
    render

    assert_select "form[action=?][method=?]", agreement_path(@agreement), "post" do

      assert_select "input#agreement_amount[name=?]", "agreement[amount]"

      assert_select "input#agreement_fulfilled[name=?]", "agreement[fulfilled]"

      assert_select "input#agreement_lender_id[name=?]", "agreement[lender_id]"

      assert_select "input#agreement_target_id[name=?]", "agreement[target_id]"
    end
  end
end
