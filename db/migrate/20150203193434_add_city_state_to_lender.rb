class AddCityStateToLender < ActiveRecord::Migration
  def change
    add_column :lenders, :city, :string, null: true
    add_column :lenders, :state, :string
  end
end
