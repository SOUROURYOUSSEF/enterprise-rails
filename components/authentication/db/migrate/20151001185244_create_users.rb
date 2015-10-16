class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :usernamem, nul: false
      t.string :email, null: false
      t.string :title
      t.string :department
      t.text   :notes
      t.string :password_digest
      t.boolean  :admin, :default => false
      t.timestamp :deleted_at
      t.string :image_file_path
      t.string :image_content_type
      t.integer :image_file_size
      t.timestamp :image_updated_at
      t.string :password_salt
      t.timestamps null: false
    end

      add_index(:users, :email, unique: true)
      add_index(:users, :username, unique: true)
      add_index(:users, [:first_name, :last_name], unique: true)
    end
end
