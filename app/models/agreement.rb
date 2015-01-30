class Agreement < ActiveRecord::Base
  include ActiveRecordExtension
  validates :amount, :fulfilled, presence: true


  belongs_to :lender
  belongs_to :target
  
  DISPLAY_COLS = ["amount"=>"Agreement amount","fulfilled"=>"Amount Fulfilled"]
  PARENT = ["lender","target"]
end
  