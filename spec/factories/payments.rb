FactoryBot.define do
  factory :payment do
    token { '4242424242424242' }
    post_number { '123-4567' }
    prefecture_id { 12 }
    city { '歩下市' }
    house_number { '12-34' }
    building { 'ホゲビル79号室' }
    phone_number { '09012345678' }
  end
end
