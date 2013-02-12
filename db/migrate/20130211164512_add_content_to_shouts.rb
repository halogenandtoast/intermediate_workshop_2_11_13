class AddContentToShouts < ActiveRecord::Migration
  def change
    add_column :shouts, :content_id, :integer
    add_column :shouts, :content_type, :string
    add_index :shouts, [:content_id, :content_type]
  end
end
