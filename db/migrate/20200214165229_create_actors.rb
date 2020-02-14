class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :age
      t.timestamps
    end

    create_table :movie_actors do |t|
      t.references :actor, foreign_key: true
      t.references :movie, foreign_key: true
    end
  end
end
