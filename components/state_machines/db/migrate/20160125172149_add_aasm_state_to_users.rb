class AddAasmStateToUsers < ActiveRecord::Migration
  def change

    change_table('users') do |t|
      t.string   :aasm_state
    end

  end
end
