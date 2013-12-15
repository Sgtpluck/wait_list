class AddHelpedToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :helped, :boolean, default: false
  end

end
