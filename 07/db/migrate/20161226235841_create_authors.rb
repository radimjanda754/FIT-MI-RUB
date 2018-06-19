class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :username
      t.string :firstname
      t.string :surname

      t.timestamps
    end
  end
end
