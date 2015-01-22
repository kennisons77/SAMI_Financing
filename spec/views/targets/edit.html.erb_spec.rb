require 'rails_helper'

RSpec.describe "targets/edit", :type => :view do
  before(:each) do
    @target = assign(:target, Target.create!(
      :amount => "9.99",
      :yield => "9.99",
      :borrower => nil,
      :deal => nil
    ))
  end

  it "renders the edit target form" do
    render

    assert_select "form[action=?][method=?]", target_path(@target), "post" do

      assert_select "input#target_amount[name=?]", "target[amount]"

      assert_select "input#target_yield[name=?]", "target[yield]"

      assert_select "input#target_borrower_id[name=?]", "target[borrower_id]"

      assert_select "input#target_deal_id[name=?]", "target[deal_id]"
    end
  end
end
