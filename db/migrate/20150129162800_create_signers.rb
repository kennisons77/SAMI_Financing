class CreateSigners < ActiveRecord::Migration
  def change
    create_table :signers do |t|
      t.references :lender, index: true
      t.string :first, :null => false
      t.string :last, :null => false
      t.string :email, :null => false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
