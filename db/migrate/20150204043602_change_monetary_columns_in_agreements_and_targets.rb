class ChangeMonetaryColumnsInAgreementsAndTargets < ActiveRecord::Migration
  def up
    add_money :targets, :amount, currency: { present: false }
    change_column :targets, :amount_cents, :integer, after: :amount
    
    Target.find_each do |target|
      target.amount_cents = target.amount * 100
      target.save
    end
    
    remove_column :targets, :amount


    add_money :agreements, :amount, currency: { present: false }    
    change_column :agreements, :amount_cents, :integer, after: :amount
    
    add_money :agreements, :fulfilled, currency: { present: false }    
    change_column :agreements, :fulfilled_cents, :integer, after: :fulfilled
    
    Agreement.find_each do |target|
      target.amount_cents = target.amount * 100
      target.fulfilled_cents = target.fulfilled * 100
      target.save
    end
    
    remove_column :agreements, :amount
    remove_column :agreements, :fulfilled
  end
  
  def down 
    add_column :targets, :amount, precision: 15, scale: 2, null: false   
         
    Target.find_each do |target|
      target.amount = target.amount_cents / 100
      target.save
    end    
    
    remove_money :targets, :amount, currency: { present: false } 
    
    
    add_column :agreements, :amount, precision: 15, scale: 2, null: false        
    add_column :agreements, :fulfilled, precision: 15, scale: 2, null: false 
    
    Agreement.find_each do |target|
      target.amount = target.amount_cents / 100
      target.fulfilled = target.fulfilled_cents / 100
      target.save
    end           
    
    remove_money :agreements, :amount, currency: { present: false }    
    remove_money :agreements, :fulfilled, currency: { present: false }           
  end
end
