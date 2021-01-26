# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 6) }
    email                   { Faker::Internet.free_email }
    password                { '999999a' }
    password_confirmation   { password }
    last_name               { '河合' }
    first_name              { '敦史' }
    last_name_kana          { 'カワイ' }
    first_name_kana         { 'アツシ' }
    birth_date              { '1991-06-18' }
  end
end
