class CreateToDos < ActiveRecord::Migration
  def self.up
    create_table :to_dos do |t|
      t.string :title
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :to_dos
  end
end
