require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should belong_to(:blogger) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(140) }
    it { should define_enum_for(:status).with_default(:posted) }
  end
end
