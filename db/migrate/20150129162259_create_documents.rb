class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :deal, index: true
      t.string :title, :null => false
      t.integer :type
      t.string :url

      t.timestamps
    end
  end
end
