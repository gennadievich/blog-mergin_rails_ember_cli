class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :ballot, index: true
      t.references :beer, index: true
      t.integer :weight
      t.timestamps
    end
  end
end
