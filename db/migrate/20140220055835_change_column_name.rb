class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :providers, :user_id, :adie_id
  end
end
