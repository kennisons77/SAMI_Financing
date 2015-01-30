class Target < ActiveRecord::Base
  include ActiveRecordExtension
  validates :borrower_id, :deal_id, :yield, presence: true
  
  belongs_to :borrower
  belongs_to :deal
  
    DISPLAY_COLS = ["title"]
    CHILD_COL = "active_deals"
    PARENT = ["borrower","deal"]

  def title
    "#{amount} for #{self.deal.title}"
  end
end
