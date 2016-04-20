require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username).
       with_message('You need a user name to create an account.') }
  it { should have_many(:posts) }
end
