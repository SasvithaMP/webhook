class CreateHooks < ActiveRecord::Migration[6.0]
  def change
    create_table :hooks do |t|
      t.string :name
      t.text :data
      t.string  :req
      t.timestamps
    end
    add_index :hooks, :name, unique: true
  end
end
