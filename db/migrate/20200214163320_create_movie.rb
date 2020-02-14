class CreateMovie < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.timestamps
      t.references :studio, foreign_key: true
    end
  end
end
