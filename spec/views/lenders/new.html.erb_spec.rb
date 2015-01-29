require 'rails_helper'

RSpec.describe "lenders/new", :type => :view do
  before(:each) do
    assign(:lender, Lender.new(
      :title => "MyString",
      :account => 1,
      :active => false
    ))
  end

  it "renders new lender form" do
    render

    assert_select "form[action=?][method=?]", lenders_path, "post" do

      assert_select "input#lender_title[name=?]", "lender[title]"

      assert_select "input#lender_account[name=?]", "lender[account]"

      assert_select "input#lender_active[name=?]", "lender[active]"
    end
  end
end
