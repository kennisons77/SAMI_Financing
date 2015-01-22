class AddActiveToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :active, :boolean, null: false, default: true
  end
end
