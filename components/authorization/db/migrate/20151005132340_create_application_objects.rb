class CreateApplicationObjects < ActiveRecord::Migration
  def change
    create_table :application_objects do |t|
      t.integer :instance_id, :null => false
      t.integer :parent_class_id
      t.string  :parent_class_name
      t.integer :permissions_mask
      t.timestamps null: false
    end

    add_reference :application_objects, :application_scope, index: true
    add_reference :application_objects, :application_class, index: true
    add_reference :application_objects, :user, index: true

    add_foreign_key :application_objects, :application_scopes
    add_foreign_key :application_objects, :application_classes
    add_foreign_key :application_objects, :users
  end
end
