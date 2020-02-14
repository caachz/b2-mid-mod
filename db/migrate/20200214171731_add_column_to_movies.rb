class AddColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :creation_year, :integer
    add_column :movies, :genre, :string
    remove_column :actors, :age, :string
    add_column :actors, :age, :integer

  end
end
