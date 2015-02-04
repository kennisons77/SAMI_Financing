require 'rails_helper'

RSpec.describe "trades/new", :type => :view do
  before(:each) do
    assign(:trade, Trade.new(
      :buy => false,
      :cusip => "MyString",
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
    ))
  end

  it "renders new trade form" do
    render

    assert_select "form[action=?][method=?]", trades_path, "post" do

      assert_select "input#trade_buy[name=?]", "trade[buy]"

      assert_select "input#trade_cusip[name=?]", "trade[cusip]"

      assert_select "input#trade_pool[name=?]", "trade[pool]"

      assert_select "input#trade_coupon[name=?]", "trade[coupon]"

      assert_select "input#trade_original_face[name=?]", "trade[original_face]"

      assert_select "input#trade_current_face[name=?]", "trade[current_face]"

      assert_select "input#trade_factor[name=?]", "trade[factor]"

      assert_select "input#trade_price[name=?]", "trade[price]"

      assert_select "input#trade_market_value[name=?]", "trade[market_value]"

      assert_select "input#trade_interest[name=?]", "trade[interest]"

      assert_select "input#trade_total_mv_wac[name=?]", "trade[total_mv_wac]"

      assert_select "input#trade_margin_mv[name=?]", "trade[margin_mv]"

      assert_select "input#trade_cash[name=?]", "trade[cash]"

      assert_select "input#trade_target_id[name=?]", "trade[target_id]"
    end
  end
end
