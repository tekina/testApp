class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.text :post
      t.string :summary

      t.timestamps
    end
  end
end
