class AddLenderIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lender_id, :integer, null: true
  end
end
