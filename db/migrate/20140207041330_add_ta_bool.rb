class AddTaBool < ActiveRecord::Migration
  def change
    add_column :adies, :ta, :boolean, default: false
  end
end
