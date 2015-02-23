class Borrower < ActiveRecord::Base
  include ActiveRecordExtension
  validates :title, presence: true, uniqueness: true
  has_many :targets
  has_many :deals, through: :targets
  
  DISPLAY_COLS = {:title=>"Title",:deals=>"Active Deals"}

end
