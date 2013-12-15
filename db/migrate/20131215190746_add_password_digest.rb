class AddPasswordDigest < ActiveRecord::Migration
  def change
    add_column :adies, :password_digest, :string
  end
end
