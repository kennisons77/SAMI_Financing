class AddStatusToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :status, :integer, null: true
  end
end
