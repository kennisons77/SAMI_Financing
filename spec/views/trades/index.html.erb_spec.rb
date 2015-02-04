require 'rails_helper'

RSpec.describe "trades/index", :type => :view do
  before(:each) do
    assign(:trades, [
      Trade.create!(
        :buy => false,
        :cusip => "Cusip",
        :pool => 1,
        :coupon => "9.99",
        :original_face => "9.99",
        :current_face => "9.99",
        :factor => "9.99",
        :price => "9.99",
        :market_value => "9.99",
        :interest => "9.99",
        :total_mv_wac => "9.99",
        :margin_mv => "9.99",
        :cash => "9.99",
        :target => nil
      ),
      Trade.create!(
        :buy => false,
        :cusip => "Cusip",
        :pool => 1,
        :coupon => "9.99",
        :original_face => "9.99",
        :current_face => "9.99",
        :factor => "9.99",
        :price => "9.99",
        :market_value => "9.99",
        :interest => "9.99",
        :total_mv_wac => "9.99",
        :margin_mv => "9.99",
        :cash => "9.99",
        :target => nil
      )
    ])
  end

  it "renders a list of trades" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Cusip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
