require 'rails_helper'

RSpec.describe "documents/new", :type => :view do
  before(:each) do
    assign(:document, Document.new(
      :deal => nil,
      :type => "",
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do

      assert_select "input#document_deal_id[name=?]", "document[deal_id]"

      assert_select "input#document_type[name=?]", "document[type]"

      assert_select "input#document_title[name=?]", "document[title]"

      assert_select "input#document_url[name=?]", "document[url]"
    end
  end
end
