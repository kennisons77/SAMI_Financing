require 'rails_helper'

RSpec.describe "signers/edit", :type => :view do
  before(:each) do
    @signer = assign(:signer, Signer.create!(
      :lender => nil,
      :first => "MyString",
      :last => "MyString",
      :email => "MyString",
      :active => false
    ))
  end

  it "renders the edit signer form" do
    render

    assert_select "form[action=?][method=?]", signer_path(@signer), "post" do

      assert_select "input#signer_lender_id[name=?]", "signer[lender_id]"

      assert_select "input#signer_first[name=?]", "signer[first]"

      assert_select "input#signer_last[name=?]", "signer[last]"

      assert_select "input#signer_email[name=?]", "signer[email]"

      assert_select "input#signer_active[name=?]", "signer[active]"
    end
  end
end
