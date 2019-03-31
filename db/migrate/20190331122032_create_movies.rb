class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :description
      t.references :user, foreign_key: true
      t.integer :visualization,default:0

      t.timestamps
    end
  end
end
