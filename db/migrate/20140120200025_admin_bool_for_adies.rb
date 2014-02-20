class AdminBoolForAdies < ActiveRecord::Migration
  def change
    add_column :adies, :admin, :boolean, default: false
  end
end
