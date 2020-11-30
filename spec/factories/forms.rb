FactoryBot.define do
  factory :form do
    token             { 'tok_abcdefghijk00000000000000000' }
    post_code         { '123-4567' }
    prefecture        { 1 }
    city              { '品川区' }
    address           { '2-3' }
    building          { '建物' }
    phone_number      { '09088889999' }
  end
end
