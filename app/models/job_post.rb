class JobPost < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	   mapping dynamic: false do 
     indexes :title, analyzer: 'english'
     indexes :description, analyzer: 'english'
     indexes :location, analyzer: 'english'
     indexes :company, analyzer: 'english'
   end
	def self.search(query) 
  __elasticsearch__.search(
    { query: {
      multi_match: {
        query: query,
        fields: ['title', 'company', 'location', 'description']
        }
      } # more blocks can go here. 
    })
	end
  enum job_type: [:full_time, :part_time, :internship, :apprenticeship]
	has_and_belongs_to_many :skills
  has_and_belongs_to_many :users
end
JobPost.__elasticsearch__.create_index! force: true
