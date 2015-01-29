require 'rails_helper'

RSpec.describe "agreements/show", :type => :view do
  before(:each) do
    @agreement = assign(:agreement, Agreement.create!(
      :amount => "9.99",
      :fulfilled => "9.99",
      :lender => nil,
      :target => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
