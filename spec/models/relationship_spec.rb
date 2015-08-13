require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before :each do
    @relationship = Relationship.new(follower_id: 1, followed_id: 2)
  end

  it 'is valid with follower and followed id' do
    expect(@relationship).to be_valid
  end

  it 'is is valid without follower id' do
    @relationship.follower_id = nil
    expect(@relationship).not_to be_valid
  end

  it 'is is valid without followed id' do
    @relationship.followed_id = nil
    expect(@relationship).not_to be_valid
  end
end
