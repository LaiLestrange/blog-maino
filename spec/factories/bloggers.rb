FactoryBot.define do
  factory :blogger do
    email { 'blogger@email.com' }
    password { 'p4ssw0rd' }
    username { 'th3bl0gg3r' }
    fullname { 'Name of Blogger' }
  end
end
