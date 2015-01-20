class Borrower < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :targets
  has_many :deals, through: :targets
  
end
