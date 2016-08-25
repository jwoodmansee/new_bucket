class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :goal
      t.string :discription
      t.boolean :completed
      t.belongs_to :bucket, foreign_key: true

      t.timestamps
    end
  end
end
