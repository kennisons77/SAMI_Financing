require 'rails_helper'

RSpec.describe "trades/show", :type => :view do
  before(:each) do
    @trade = assign(:trade, Trade.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Cusip/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
