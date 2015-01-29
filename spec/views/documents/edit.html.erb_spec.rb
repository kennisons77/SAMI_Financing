require 'rails_helper'

RSpec.describe "documents/edit", :type => :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :deal => nil,
      :type => "",
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input#document_deal_id[name=?]", "document[deal_id]"

      assert_select "input#document_type[name=?]", "document[type]"

      assert_select "input#document_title[name=?]", "document[title]"

      assert_select "input#document_url[name=?]", "document[url]"
    end
  end
end
