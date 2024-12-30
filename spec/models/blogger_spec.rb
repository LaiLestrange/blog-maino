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

  describe '#format' do
    it 'username is alphanumeric' do
      blogger = Blogger.new(username: 'ç;é=à\ñ')

      blogger.valid?
      errs = blogger.errors
      result = errs.include?(:username)

      expect(result).to be true
      expect(errs[:username]).to include 'deve conter apenas letras e/ou números'
    end
  end
end
