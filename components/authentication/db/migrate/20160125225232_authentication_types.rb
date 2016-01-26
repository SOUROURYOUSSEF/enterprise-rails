class AuthenticationTypes < ActiveRecord::Migration
  def change
    create_table :auth_providers do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret
      t.string :username
      t.timestamps
    end
  end
end
