FactoryBot.define do
  factory :delivery_order do 
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"長野市"}
    address {"1-5"}
    phone_number {"09012345678"}
  end
end
