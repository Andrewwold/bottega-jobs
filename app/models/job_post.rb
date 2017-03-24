class JobPost < ApplicationRecord
  enum job_type: [:full_time, :part_time, :internship, :apprenticeship]
	has_and_belongs_to_many :skills
  has_and_belongs_to_many :users
end

