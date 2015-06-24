class CreatePours < ActiveRecord::Migration
  def change
    create_table :pours do |t|
      t.integer :tap
      t.decimal :volume_oz
      t.string :time

      t.timestamps
    end
  end
end
