require 'rails_helper'

describe ArtistObserver do
  it "should enqueue a job after an artist is save" do
    expect{Artist.create(name: "test")}.to change{QC.count}.by(1)
  end
end
