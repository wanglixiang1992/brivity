# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :post, null: false, foreign_key: true, on_delete: :cascade
      t.references :author, null: false, foreign_key: { to_table: :users }, on_delete: :cascade
      t.timestamps null: false
    end
  end
end
