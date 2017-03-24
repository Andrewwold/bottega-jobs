class AddApiToJobPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :api_name, :string
    add_column :job_posts, :api_id, :string
  end
end
