class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :helper
      t.integer :rating
      t.text :solution
      t.integer :satisfaction
      t.integer :problem_id

      t.timestamps
    end
  end
end
