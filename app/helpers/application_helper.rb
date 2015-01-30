module ApplicationHelper
  
  #returns attriobutes for object minus the  back end stuff
  def get_display_cols(object)
    cols =[]
    unless object.nil?
      if object.class::DISPLAY_COLS.empty?
        cols = object.attributes.keys
        remove = ["id","created_at","updated_at","parent_id"]
        cols =  cols-remove
      else
        cols << object.class::DISPLAY_COLS
        return object.class::DISPLAY_COLS + ( object.class::CHILD_COL if object.class::CHILD_COL)
      end
      unless object.class::CHILD_COL.empty?
        cols << object.class::CHILD_COL
      end
      return cols
    end
  end
  

end
