class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.string :city
      t.string :state
      t.integer :views
      t.string :company
      t.string :additional_title
      t.text :addition_description
      t.timestamps
    end
  end
end
