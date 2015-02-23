class Lender < ActiveRecord::Base
  include ActiveRecordExtension
  validates :title, :account, presence: true
  
  belongs_to :user
  has_many :agreements
  has_many :targets, through: :agreements
  
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  
  DISPLAY_COLS = {:title=>"Title",:account=>"Account #"}

end
