class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :starting_at
      t.text :description
      t.string :title
      t.string :place
      t.column :organizer_id, :integer, :null => false, :references => :users
      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :events
  end
end
