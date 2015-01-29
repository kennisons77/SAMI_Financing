require 'rails_helper'

RSpec.describe "lenders/edit", :type => :view do
  before(:each) do
    @lender = assign(:lender, Lender.create!(
      :title => "MyString",
      :account => 1,
      :active => false
    ))
  end

  it "renders the edit lender form" do
    render

    assert_select "form[action=?][method=?]", lender_path(@lender), "post" do

      assert_select "input#lender_title[name=?]", "lender[title]"

      assert_select "input#lender_account[name=?]", "lender[account]"

      assert_select "input#lender_active[name=?]", "lender[active]"
    end
  end
end
