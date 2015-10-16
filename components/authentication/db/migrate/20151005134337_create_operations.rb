class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string  :name, :null => false
      t.text    :description
      t.integer :sequence
      t.timestamps null: false
    end
    add_reference :operations, :application_class, :index => true
    add_foreign_key :operations, :application_classes
  end

end
