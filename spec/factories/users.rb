FactoryBot.define do
  factory :user do
    nickname              {"とーふ"}
    email                 {"test@example"}
    password              {"touhu102"}
    password_confirmation {password}
    full_surname {"山田"}
    full_name{"健斗"}
    half_surname{"ヤマダ"}
    half_name{"ケント"}
    birthday{"2000-01-01"}
  end
end