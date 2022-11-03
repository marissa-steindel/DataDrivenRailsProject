class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.integer :pages
      t.text :synopsis
      t.references :author, null: true, foreign_key: true
      t.references :publisher, null: true, foreign_key: true

      t.timestamps
    end
  end
end
