FactoryBot.define do
  factory :purchase_address do
    postal_code              {"123-4567"}
    city              {"ああああ"}
    address {"ああああ"}
    building{"ああああ"}
    phone_number{"09012345678"}
    prefecture_id{2}
    token{"tok_abcdefghijk00000000000000000"}
  end
end
