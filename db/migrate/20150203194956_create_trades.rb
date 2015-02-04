class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.date :trade_date, null: false
      t.date :settlement_date, null: false
      t.boolean :buy, default: true, null: false
      t.string :cusip, null: false
      t.integer :pool, null: false
      t.decimal :coupon, precision: 6, scale: 3, null: false 
      t.decimal :original_face, precision: 15, scale: 2
      t.decimal :current_face, precision: 15, scale: 2
      t.decimal :factor, precision: 9, scale: 8
      t.decimal :price, precision: 10, scale: 5 
      t.decimal :market_value, precision: 15, scale: 2
      t.decimal :interest, precision: 15, scale: 2 
      t.decimal :total_mv_wac, precision: 15, scale: 2 
      t.decimal :margin_mv, precision: 15, scale: 2
      t.decimal :cash, precision: 15, scale: 2
      t.references :target, index: true

      t.timestamps
    end
  end
end
