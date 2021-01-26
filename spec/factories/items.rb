# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'オムライス' }
    info { '美味しい商品です' }
    category_id              { 2 }
    sales_status_id          { 2 }
    shipping_fee_status_id   { 2 }
    prefecture_id            { 2 }
    scheduled_delivery_id    { 2 }
    price                    { 10000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
