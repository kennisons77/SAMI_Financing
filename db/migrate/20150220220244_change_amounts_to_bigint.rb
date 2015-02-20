class ChangeAmountsToBigint < ActiveRecord::Migration
  def self.up
    change_column :agreements, :amount_cents, :bigint    
    change_column :agreements, :fullfilled_cents, :bigint    
    change_column :targets, :amount_cents, :bigint    
    change_column :trades, :original_face_cents, :bigint    
    change_column :trades, :current_face_cents, :bigint    
    change_column :trades, :market_value_cents, :bigint    
    change_column :trades, :interest_cents, :bigint    
    change_column :trades, :total_mv_wac_cents, :bigint    
    change_column :trades, :margin_mv_cents, :bigint    
    change_column :trades, :cash_cents, :bigint    
  end
  
  def self.down
    change_column :agreements, :amount_cents, :integer    
    change_column :agreements, :fullfilled_cents, :integer    
    change_column :targets, :amount_cents, :integer    
    change_column :trades, :original_face_cents, :integer    
    change_column :trades, :current_face_cents, :integer    
    change_column :trades, :market_value_cents, :integer    
    change_column :trades, :interest_cents, :integer    
    change_column :trades, :total_mv_wac_cents, :integer    
    change_column :trades, :margin_mv_cents, :integer    
    change_column :trades, :cash_cents, :integer    
  end
end
