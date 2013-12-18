class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :type
      t.string :description
      t.string :estimate
      t.integer :adie_id

      t.timestamps
    end

    remove_column :adies, :problem, :string
  end
end
