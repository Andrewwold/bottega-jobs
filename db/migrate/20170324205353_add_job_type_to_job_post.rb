class AddJobTypeToJobPost < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :job_type, :integer
  end
end
