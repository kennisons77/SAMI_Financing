class Trade < ActiveRecord::Base
  belongs_to :target
  monetize :original_face
  monetize :current_face
  monetize :price
  monetize :market_value
  monetize :interest
  monetize :total_mv_wac
  monetize :margin_mv
  monetize :cash

  #DISPLAY_COLS = [:title=>"Title"]
  CHILD_COL = ""
  PARENT = ["target"]
  
 def title
    "#{self.original_face} for #{self.target.title}"
  end
  
end
