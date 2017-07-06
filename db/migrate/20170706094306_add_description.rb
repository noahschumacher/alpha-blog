class AddDescription < ActiveRecord::Migration[5.1]

  # Adding coolmuns to the Article table
  def change
  	add_column :articles, :description, :text
  	add_column :articles, :created_at, :datetime
  	add_column :articles, :updated_at, :datetime
  end
end
