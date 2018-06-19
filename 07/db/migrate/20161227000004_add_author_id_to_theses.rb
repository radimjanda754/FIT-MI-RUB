class AddAuthorIdToTheses < ActiveRecord::Migration[5.0]
  def change
    add_column :theses, :author_id, :integer
    add_index :theses, :author_id
  end
end
