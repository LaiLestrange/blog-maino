class AddUsernameAsIndexToBlogger < ActiveRecord::Migration[7.1]
  def change
    add_index :bloggers, :username, unique: true
  end
end
