class Lender < ActiveRecord::Base
  validates :title, :account, presence: true
  
  has_many :agreements
  has_many :targets, through: :agreements
  
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
