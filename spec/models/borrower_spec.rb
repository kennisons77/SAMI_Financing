require 'rails_helper'

RSpec.describe Borrower, :type => :model do
  borrower = FactoryGirl.create(:borrower)
  it "has a valid factory" do 
    expect(borrower).to be_valid 
  end 
    
  it "is invalid withouit a title" do
    expect(FactoryGirl.build(:borrower, title: nil)).not_to be_valid
  end  
  
  it "is invalid when adding an already taken title" 
  
end
