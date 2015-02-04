class Target < ActiveRecord::Base
  include ActiveRecordExtension
  validates :borrower_id, :deal_id, :yield, presence: true
  
  belongs_to :borrower
  belongs_to :deal
  has_many :trades
  
  DISPLAY_COLS = {:amount=>"Amount",:yield=>"Yield",:borrower=>"Borrower",:deal=>"Deal"}
  CHILD_COL = {}
  PARENT = ["borrower","deal"]

  def title
    "#{self.amount} for #{self.deal.title}"
  end
end
