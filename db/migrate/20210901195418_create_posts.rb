# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :author, null: false, foreign_key: { to_table: :users }, on_delete: :cascade
      t.timestamps null: false
    end
  end
end
