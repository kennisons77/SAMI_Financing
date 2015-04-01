class Signer < ActiveRecord::Base
  include ActiveRecordExtension
  validates :first, :last, presence: true
  validates :last, uniqueness: { scope: :first }
    
  belongs_to :lender
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }  

  DISPLAY_COLS = {:last=>"Last Name",:first=>"First Name",:email=>"Email"}
  PARENT = ["lender"]
end
