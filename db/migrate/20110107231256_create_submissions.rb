class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.integer :author_id, :null => false, :references => :users
      t.references :event, :null => false
      t.string :title, :null => false
      t.text :description

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :submissions
  end
end
