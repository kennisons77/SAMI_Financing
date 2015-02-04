class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.date :trade_date, null: false
      t.date :settlement_date, null: false
      t.boolean :buy, default: true, null: false
      t.string :cusip, null: false
      t.integer :pool, null: false
      t.decimal :coupon, precision: 6, scale: 3, null: false 
      t.money :original_face, currency: { present: false }
      t.money :current_face, currency: { present: false }
      t.decimal :factor, precision: 9, scale: 8
      t.money :price, currency: { present: false }
      t.money :market_value, currency: { present: false }
      t.money :interest, currency: { present: false }
      t.money :total_mv_wac, currency: { present: false }
      t.money :margin_mv, currency: { present: false }
      t.money :cash, currency: { present: false }
      t.references :target, index: true

      t.timestamps
    end
  end
end
