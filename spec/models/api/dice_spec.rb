require 'rails_helper'
require './lib/api/dice'

RSpec.describe Api::Dice, type: :model do
  it "Fetches info from the dice api" do
    response = Api::Dice.get("developer", "84043")

    expect(response.count).to eq 50
  end

  it "Parses the response and loads the database" do
    jobs = Api::Dice.get("developer", "84043")
    Api::Dice.parse(jobs)

    expect(JobPost.count).to eq 50
  end
end
