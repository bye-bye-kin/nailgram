class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
    t.references :post,foreign_key: true,null: false
    t.references :user,foreign_key: true, null: false
    # foreign_key:trueは外部キーとして使用することを示す
      t.timestamps
    end
  end
end
