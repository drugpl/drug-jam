class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :user, :null => false
      t.references :submission, :null => false

      t.timestamps :null => false
    end
    add_index :votes, [:user_id, :submission_id], :name => "votes_user_id_submission_id_unique_index", :unique => true
  end

  def self.down
    remove_index :votes, :name => "votes_user_id_submission_id_unique_index"
    drop_table :votes
  end
end
