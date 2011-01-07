class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :attendant_id, :null => false, :references => :users
      t.integer :event_id, :null => false
      t.string :comment

      t.timestamps :null => false
    end
    add_index :attendances, [:attendant_id, :event_id], :unique => true, :name => "attendances_attendant_id_event_id_unique_index"
  end

  def self.down
    remove_index :attendances, :name => "attendances_attendant_id_event_id_unique_index"
    drop_table :attendances
  end
end
