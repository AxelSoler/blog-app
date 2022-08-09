class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author_id, :user, foreign_key: true
      t.references :post_id, :post, foreign_key: true

      t.timestamps
    end
  end
end
