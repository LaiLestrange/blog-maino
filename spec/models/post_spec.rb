require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should belong_to(:blogger) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(140) }
    it { should define_enum_for(:status).with_default(:posted) }
  end

  describe '#after_update' do
    it 'sets the status to edited' do
      post = create(:post, text: 'testando o after_update', status: :posted)
      post.update!(text: 'updated, what now?')
      expect(post.status).to eq('edited')
    end
  end
end
