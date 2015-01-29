require 'rails_helper'

RSpec.describe "signers/index", :type => :view do
  before(:each) do
    assign(:signers, [
      Signer.create!(
        :lender => nil,
        :first => "First",
        :last => "Last",
        :email => "Email",
        :active => false
      ),
      Signer.create!(
        :lender => nil,
        :first => "First",
        :last => "Last",
        :email => "Email",
        :active => false
      )
    ])
  end

  it "renders a list of signers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "First".to_s, :count => 2
    assert_select "tr>td", :text => "Last".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
