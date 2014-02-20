class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :uid
      t.string :secret
      t.string :token

      t.timestamps
    end
  end
end
