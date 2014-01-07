class ChangingHelpedFromBoolean < ActiveRecord::Migration
  def change
    change_column :problems, :helped, :string, default: 'needs help'
  end
end
