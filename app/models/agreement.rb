class Agreement < ActiveRecord::Base
  include ActiveRecordExtension
  validates :amount, :fulfilled, presence: true

  enum status: [ :selected, :confirmed, :rejected ]

  belongs_to :lender
  belongs_to :target
  
  scope :selected, -> { where(status: statuses[:confirmed]) }
  scope :confirmed, -> { where(status: statuses[:selected]) }
  scope :rejected, -> { where(status: statuses[:rejected]) }
  scope :submitted, -> { where(status: nil)}
    
  DISPLAY_COLS = [:amount=>"Agreement Amount",:fulfilled=>"Amount Fulfilled"]
  PARENT = ["lender","target"]
end
  