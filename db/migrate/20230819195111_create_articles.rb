class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      # created_at & updated_at
      t.timestamps
    end
  end
end
