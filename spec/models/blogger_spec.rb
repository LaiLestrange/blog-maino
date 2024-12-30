require 'rails_helper'

RSpec.describe Blogger, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    
    it { should validate_length_of(:fullname) }
    it { should validate_length_of(:username) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end
end
