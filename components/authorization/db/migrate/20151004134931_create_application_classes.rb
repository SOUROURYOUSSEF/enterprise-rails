class CreateApplicationClasses < ActiveRecord::Migration
  def change
    create_table :application_classes do |t|
      t.string :name, :null => false
      t.string :description
      t.integer :parent_class_id
      t.string :parent_class_name
      t.timestamps null: false
    end

    add_index(:application_classes, :name, unique: true)
  end
end
