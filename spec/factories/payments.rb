FactoryBot.define do
  factory :payment do
    card_number { 4242424242424242 }
    card_exp_month { 3 }
    card_exp_year { 24 }
    card_cvc {123}
    post_number {123-4567 }
    prefecture_id { 12 }
    city { "歩下市" }
    house_number { "12-34" }
    building { "ホゲビル79号室" }
    phone_number { "09012345678" }

    association :user
    association :item

  end
end
