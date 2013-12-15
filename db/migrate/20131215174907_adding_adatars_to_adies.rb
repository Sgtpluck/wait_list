class AddingAdatarsToAdies < ActiveRecord::Migration
  def change
    add_column :adies, :adatar, :string
  end
end
