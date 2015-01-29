require 'rails_helper'

RSpec.describe "lenders/index", :type => :view do
  before(:each) do
    assign(:lenders, [
      Lender.create!(
        :title => "Title",
        :account => 1,
        :active => false
      ),
      Lender.create!(
        :title => "Title",
        :account => 1,
        :active => false
      )
    ])
  end

  it "renders a list of lenders" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
