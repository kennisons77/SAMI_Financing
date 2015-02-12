class Trade < ActiveRecord::Base
  include ActiveRecordExtension

  belongs_to :target
  monetize :original_face_cents
  monetize :current_face_cents
  monetize :price_cents
  monetize :market_value_cents
  monetize :interest_cents
  monetize :total_mv_wac_cents
  monetize :margin_mv_cents
  monetize :cash_cents

  validates :cusip, uniqueness: {scope: [:trade_date,:target_id,:buy], message:"Duplicate trade for target"}


  #DISPLAY_COLS = [:title=>"Title"]
  CHILD_COL = ""
  PARENT = ["target"]
 
 
 def title
    "#{self.original_face} for #{self.target.title}"
  end
 
 
end
