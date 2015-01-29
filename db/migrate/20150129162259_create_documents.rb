class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :deal, index: true
      t.string :type, :null => false
      t.string :title, :null => false
      t.string :url

      t.timestamps
    end
  end
end
