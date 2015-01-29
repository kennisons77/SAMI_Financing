class Signer < ActiveRecord::Base
  validates :first, :last, presence: true
  validates :last, uniqueness: { scope: :first }
    
  belongs_to :lender
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }  
end
