class Trade < ActiveRecord::Base
  belongs_to :target
  
  #DISPLAY_COLS = [:title=>"Title"]
  CHILD_COL = ""
  PARENT = ["target"]
  
 def title
    "#{self.original_face} for #{self.target.title}"
  end
  
end
