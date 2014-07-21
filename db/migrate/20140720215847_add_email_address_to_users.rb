class AddEmailAddressToUsers < ActiveRecord::Migration
  def change
    add_column :adies, :email, :string
    add_column :adies, :current, :boolean, default: true
  end
end
