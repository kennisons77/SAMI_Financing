require 'rails_helper'

RSpec.describe "signers/show", :type => :view do
  before(:each) do
    @signer = assign(:signer, Signer.create!(
      :lender => nil,
      :first => "First",
      :last => "Last",
      :email => "Email",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/First/)
    expect(rendered).to match(/Last/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
  end
end
