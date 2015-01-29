require 'rails_helper'

RSpec.describe "documents/show", :type => :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :deal => nil,
      :type => "Type",
      :title => "Title",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
