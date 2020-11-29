FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'q000000' }
    password_confirmation { password }
    first_name            { '山' }
    last_name             { '大' }
    first_name_kana       { 'ヤマ' }
    last_name_kana        { 'ダ' }
    birthday              { '17881111' }
  end
end
