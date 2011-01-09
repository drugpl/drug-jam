class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body, :null => false
      t.integer :author_id, :null => false, :references => :users
      t.integer :commentable_id, :references => nil
      t.string :commentable_type

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :comments
  end
end
