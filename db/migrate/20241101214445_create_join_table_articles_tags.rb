class CreateJoinTableArticlesTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :articles, :tags do |t|
      t.index :article_id
      t.index :tag_id
    end
  end
end
