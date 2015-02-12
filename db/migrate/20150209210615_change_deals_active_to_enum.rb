class ChangeDealsActiveToEnum < ActiveRecord::Migration
  def up
      add_column :deals, :status, :integer, default: 0
      Deal.find_each do|deal|
        if deal.active == true
          deal.status = 0
        else
          deal.status = 1
        end
        deal.save
      end
      
      remove_column :deals, :active
    end
  
    def down
      add_column :deals, :active, :boolean, default: true
      Deal.find_each do|deal|
        if deal.status == 0
          deal.active = true
        else
          deal.active = false
        end
        deal.save
      end
      
      remove_column :deals, :status
    end    
end
