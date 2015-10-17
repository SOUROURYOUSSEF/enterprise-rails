class CreateApplicationScopes < ActiveRecord::Migration
  def change
    create_table :application_scopes do |t|
      t.string :name, :null => false
      t.integer :parent_class_id
      t.string  :parent_class_name
      t.text   :description
      t.timestamps null: false
    end
    add_reference :application_scopes, :group, index: true
    add_foreign_key :application_scopes, :groups
  end
end
