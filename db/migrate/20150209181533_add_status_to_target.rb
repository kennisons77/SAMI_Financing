class AddStatusToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :status, :integer, null: false, default: 0
  end
end
