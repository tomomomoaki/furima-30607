FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 3) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6, max_length: 15, mix_case: true) }
    password_confirmation   { password }
    last_name               { Faker::Japanese::Name.last_name }
    first_name              { Faker::Japanese::Name.first_name }
    last_name_key           { 'アアア' }
    first_name_key          { 'イイイ' }
    birthday                { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
