FactoryBot.define do
  factory :item do
    item_name              {"名前"}
    text                 {"テスト"}
    price              {1000}
    category_id {2}
    status_id{2}
    burden_id{2}
    prefecture_id{2}
    ship_day_id{2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
