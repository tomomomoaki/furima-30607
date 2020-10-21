FactoryBot.define do
  factory :buyer_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code             { '000-9999' }
    prefecture_id           { rand(2..48) }
    municipality            { Faker::Address.city }
    address                 { '2-2-20' }
    house_number            { 'レオパレス' }
    phone_number            { '99999999999' }
  end
end
