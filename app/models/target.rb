class Target < ActiveRecord::Base
  validates :borrower_id, :deal_id, :yield, presence: true
  
  belongs_to :borrower
  belongs_to :deal
end
