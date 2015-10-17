class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :permissions_mask, :null => false
      t.timestamps null: false
    end
    add_reference :permissions, :role, index: true
    add_reference :permissions, :application_class, index: true

    add_foreign_key :permissions, :roles
    add_foreign_key :permissions, :application_classes

  end
end
