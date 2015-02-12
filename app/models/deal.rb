class Deal < ActiveRecord::Base
  include ActiveRecordExtension
  validates :collateral, :term, presence: true
  validates :collateral, uniqueness: { scope: :term }

  enum term: [ :overnight, :week, :month ]
  enum status: [ :active, :inactive ]

  has_many :targets
  has_many :borrowers, through: :targets 
  has_many :documents
  
  default_scope -> { order(:collateral,:term) }
  scope :active, -> { where(status: statuses[:active]) }
  scope :inactive, -> { where(status: statuses[:inactive]) }

  DISPLAY_COLS = {:collateral=>"Collateral", :term=>"Term", :target_count=>"Target Allocations"}
  CHILD_COLS = {:agreements=>"Confirmed Allocation Agreements"}   
   
  def title
    "#{self.collateral}.-#{self.term}"
  end
  
  def target_count
    Target.where(deal_id: self.id).count
  end
end
