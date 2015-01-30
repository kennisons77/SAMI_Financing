class Deal < ActiveRecord::Base
  include ActiveRecordExtension
  validates :collateral, :term, presence: true
  validates_inclusion_of :active, :in => [true, false]  
  validates :collateral, uniqueness: { scope: :term }

  enum term: [ :overnight, :week, :month ]

  
  has_many :targets
  has_many :borrowers, through: :targets 
  has_many :documents
  
  default_scope -> { order(:collateral,:term) }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  DISPLAY_COLS = ["collateral"=>"Collateral","term"=>"Term","active"=>"Active","agreements"=>"open Allocation Agreements"]
  CHILD_COLS = ["create_deal"=>""]    
  def title
    "#{collateral}.-#{term}"
  end
end
