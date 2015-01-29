class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :title, :null => false
      t.integer :account, :null => false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
