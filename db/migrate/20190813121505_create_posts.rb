# frozen_string_literal: true

# Migration to add table for posts.
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description
      t.text :body, null: false
      t.boolean :draft
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
