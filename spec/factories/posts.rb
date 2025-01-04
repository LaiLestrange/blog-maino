FactoryBot.define do
  factory :post do
    text { 'Texto do post, com menos de 140 caracteres.' }
    status { 0 }
    blogger
  end
end
