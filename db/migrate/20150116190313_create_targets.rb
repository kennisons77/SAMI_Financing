class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.decimal :amount, precision: 15, scale: 2 
      t.decimal :fulfilled, precision: 15, scale: 2 
      t.references :borrower, index: true
      t.references :deal, index: true

      t.timestamps
    end
  end
end
