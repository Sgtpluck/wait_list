class ChangingAdieIdToIntegerInProblems < ActiveRecord::Migration
  def change
    change_column :problems, :adie_id, :integer
  end
end
