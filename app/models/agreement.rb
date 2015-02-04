class Agreement < ActiveRecord::Base
  include ActiveRecordExtension
  monetize :amount_cents
  monetize :fulfilled_cents
  
  validates :amount, :fulfilled, presence: true

  enum status: [ :selected, :confirmed, :rejected ]
  
  belongs_to :lender
  belongs_to :target
  
  scope :selected, -> { where(status: statuses[:confirmed]) }
  scope :confirmed, -> { where(status: statuses[:selected]) }
  scope :rejected, -> { where(status: statuses[:rejected]) }
  scope :submitted, -> { where(status: nil)}
    
  DISPLAY_COLS = {:amount => "Agreement Amount",:fulfilled => "Amount Fulfilled",:lender_id => "Lender"}
  PARENT = ["lender","target"]
  
  def title
    "#{self.amount} for #{self.target}"
  end
  
  def exposure
    self.fulfilled/self.amount
  end
  
  def capacity
    self.amount-self.fulfilled
  end  
end
  