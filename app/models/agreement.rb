class Agreement < ActiveRecord::Base
  include ActiveRecordExtension
  monetize :amount_cents
  monetize :fulfilled_cents
  
  validates :amount, :fulfilled, presence: true

  enum status: [ :selected, :confirmed, :rejected, :fullfilled ]
  
  belongs_to :lender
  belongs_to :target
  
  scope :selected, -> { where(status: statuses[:selected]) }
  scope :confirmed, -> { where(status: statuses[:confirmed]) }
  scope :rejected, -> { where(status: statuses[:rejected]) }
  scope :fullfilled, -> { where(status: statuses[:fullfilled]) }
  scope :empty, -> { where(amount_cents: 0)}
  scope :not_empty, -> { where("amount_cents > 0")}
    
  DISPLAY_COLS = {:amount => "Agreement Amount",:fulfilled => "Amount Fulfilled",:lender_id => "Lender",:status=>"Status",:lender=>"Lender",:target=>"Target"}
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
  