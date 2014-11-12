class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.column :title, :string
      t.column :content, :text
      t.timestamps null: false
    end
  end
end
