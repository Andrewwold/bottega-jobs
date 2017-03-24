class ChangeViewdefault < ActiveRecord::Migration[5.0]
  def change
    change_column :job_posts, :views, :integer, default: 0 
  end
end
