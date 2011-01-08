class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :user, :null => false, :index => { :with => :submission_id, :unique => true }
      t.references :submission, :null => false

      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :votes
  end
end
