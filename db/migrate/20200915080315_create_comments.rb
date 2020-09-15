class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment,null: false
      t.references :post, foreign_key: true, null: false
      t.references :user, foreign_key: true,
      null: false
      # foreign_key:trueは外部キーとして使用することを示す。他のテーブルのデータに参照（依存）するようにカラムにつける制約。



      t.timestamps
    end
  end
end
