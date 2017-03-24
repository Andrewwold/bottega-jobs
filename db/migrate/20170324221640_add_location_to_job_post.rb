class AddLocationToJobPost < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :location, :string
  end
end
