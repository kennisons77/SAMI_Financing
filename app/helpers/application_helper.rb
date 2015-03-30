module ApplicationHelper
  
  #returns attriobutes for object minus the  back end stuff
  def get_display_cols(object)
    cols = Hash.new
    unless object.nil?
      if object.class::DISPLAY_COLS.empty?
        cols = object.attributes.symbolize_keys
        remove = [:id,:created_at,:updated_at,:parent_id]
        cols =  cols.except!(*remove)
      else
        cols = cols.merge(object.class::DISPLAY_COLS)
      end
       unless object.class::CHILD_COL.empty?
         cols = cols.merge(object.class::CHILD_COLS)
       end
      @cols = cols
    end
  end

end
