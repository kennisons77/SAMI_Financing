class AddActiveToBorrowers < ActiveRecord::Migration
  def change
      add_column :borrowers, :status, :integer, default: 1    
  end
end
