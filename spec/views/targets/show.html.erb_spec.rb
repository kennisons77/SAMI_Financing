require 'rails_helper'

RSpec.describe "targets/show", :type => :view do
  before(:each) do
    @target = assign(:target, Target.create!(
      :amount => "9.99",
      :yield => "9.99",
      :borrower => nil,
      :deal => nil
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
