class ChangeTermTypeInDeals < ActiveRecord::Migration
    
    def up
  @lengths = ["o/n","1 Week","1 Month"]
      add_column :deals, :nterm, :integer
      Deal.find_each do|deal|
        deal.nterm = @lengths.index(deal.term).to_int
        deal.save
      end
      remove_column :deals, :term
      rename_column :deals, :nterm, :term
    end
  
    def down
  @lengths = ["o/n","1 Week","1 Month"]
      add_column :deals, :nterm, :string
      Deal.find_each do|deal|
        deal.nterm =@lengths[deal.term]
        deal.save
      end
      remove_column :deals, :term
      rename_column :deals, :nterm, :term
    end    
end
