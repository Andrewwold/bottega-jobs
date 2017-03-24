class CreateJobPostsSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts_skills do |t|
      t.references :job_post, foreign_key: true
      t.references :skill, foreign_key: true
    end
  end
end
