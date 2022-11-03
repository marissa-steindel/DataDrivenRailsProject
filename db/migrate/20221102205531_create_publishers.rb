class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.references :book, null: true, foreign_key: true
      t.references :country, null: true, foreign_key: true

      t.timestamps
    end
  end
end
