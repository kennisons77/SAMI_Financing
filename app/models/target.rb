class Target < ActiveRecord::Base
  validates :borrower_id, :deal_id, :yield, presence: true
  
  belongs_to :borrower
  belongs_to :deal
  
    DISPLAY_COLS = ["title"]
    CHILD_COL = "active_deals"

end
