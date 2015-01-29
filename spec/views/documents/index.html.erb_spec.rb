require 'rails_helper'

RSpec.describe "documents/index", :type => :view do
  before(:each) do
    assign(:documents, [
      Document.create!(
        :deal => nil,
        :type => "Type",
        :title => "Title",
        :url => "Url"
      ),
      Document.create!(
        :deal => nil,
        :type => "Type",
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of documents" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
