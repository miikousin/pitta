class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer    :clothes_id, null: false
      t.integer    :season_id, null: false
      t.integer    :brand_id, null: false
      t.integer    :fit_id, null: false
      t.text       :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
