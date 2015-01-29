require 'rails_helper'

RSpec.describe "lenders/show", :type => :view do
  before(:each) do
    @lender = assign(:lender, Lender.create!(
      :title => "Title",
      :account => 1,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
