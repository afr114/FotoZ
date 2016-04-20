require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:image) }
  it { should belong_to(:user) }
end
