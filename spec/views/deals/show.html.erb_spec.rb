require 'rails_helper'

RSpec.describe "deals/show", :type => :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :collateral => "Collateral",
      :term => "Term"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Collateral/)
    expect(rendered).to match(/Term/)
  end
end
