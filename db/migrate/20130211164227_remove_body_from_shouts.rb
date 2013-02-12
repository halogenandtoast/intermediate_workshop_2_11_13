class RemoveBodyFromShouts < ActiveRecord::Migration
  def up
    delete "DELETE FROM shouts"
    remove_column :shouts, :body
  end

  def down
    add_column :shouts, :body, :text
  end
end
