class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, :null => false
      t.string :description
      t.timestamps null: false
      t.integer :application_scope_id
      t.belongs_to :application_scopes, :index => true
    end
    # add_reference :groups, :application_scopes, index: true
    # add_foreign_key :groups, :application_scopes
  end
end
