class AddRatingCommentColumnToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :rating, :boolean
    add_column :services, :comment, :text
  end
end
