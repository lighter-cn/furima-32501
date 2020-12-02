FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    last_name             { 'ほゲ野' }
    first_name            { 'ほゲ男' }
    last_name_kana        { 'ホゲノ' }
    first_name_kana       { 'ホゲオ' }
    birthday              { Faker::Date.between(from: '1940-01-01', to: '2019-12-31') }
  end
end
