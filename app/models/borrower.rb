class Borrower < ActiveRecord::Base
  include ActiveRecordExtension
  validates :title, presence: true, uniqueness: true
  has_many :targets
  has_many :deals, through: :targets
  enum status: [ :inactive, :active ]

  DISPLAY_COLS = {:title=>"Title",:status=>"Status",:deals=>"Active Deals"}
  
  scope :inactive, -> { where(status: statuses[:inactive]) }
  scope :active, -> { where(status: statuses[:active]) }


end
