class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.references :book, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
