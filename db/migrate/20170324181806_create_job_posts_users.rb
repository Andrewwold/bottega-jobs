class CreateJobPostsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts_users do |t|
      t.references :user, foreign_key: true
      t.references :job_post, foreign_key: true
    end
  end
end
