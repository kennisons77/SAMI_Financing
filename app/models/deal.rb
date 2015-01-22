class Deal < ActiveRecord::Base
  validates :collateral, :term, presence: true
  validates_inclusion_of :active, :in => [true, false]  
  validates :collateral, uniqueness: { scope: :term }
  
  has_many :targets
  has_many :borrowers, through: :targets 
  
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
 
  TERM_LENGTHS = ["o/n","1 Week","1 Month"]
  
  def title
    "#{collateral}.-#{term}"
  end
end
