class CreateAdies < ActiveRecord::Migration
  def change
    create_table :adies do |t|
      t.string :name
      t.string :problem

      t.timestamps
    end
  end
end
