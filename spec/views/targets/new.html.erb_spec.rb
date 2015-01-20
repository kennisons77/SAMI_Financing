require 'rails_helper'

RSpec.describe "targets/new", :type => :view do
  before(:each) do
    assign(:target, Target.new(
      :amount => "9.99",
      :fulfilled => "9.99",
      :borrower => nil,
      :deal => nil
    ))
  end

  it "renders new target form" do
    render

    assert_select "form[action=?][method=?]", targets_path, "post" do

      assert_select "input#target_amount[name=?]", "target[amount]"

      assert_select "input#target_fulfilled[name=?]", "target[fulfilled]"

      assert_select "input#target_borrower_id[name=?]", "target[borrower_id]"

      assert_select "input#target_deal_id[name=?]", "target[deal_id]"
    end
  end
end
