class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.decimal :amount, precision: 15, scale: 2, null: false 
      t.decimal :fulfilled, precision: 15, scale: 2, null: false, default: 0
      t.references :lender, index: true
      t.references :target, index: true

      t.timestamps
    end
  end
end
