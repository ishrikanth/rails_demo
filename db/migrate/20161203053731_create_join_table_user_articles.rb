class CreateJoinTableUserArticles < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :users,:articles
  end
end
