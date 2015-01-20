class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :collateral
      t.string :term

      t.timestamps
    end
  end
end
