FactoryBot.define do
  factory :blogger do
    sequence(:username) { "#{_1}bl0gg3r" }
    sequence(:email) { "blogger#{_1}@email.com" }
    password { 'p4ssw0rd' }
    fullname { 'Name of Blogger' }
  end
end
