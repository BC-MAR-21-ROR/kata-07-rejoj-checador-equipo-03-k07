# frozen_string_literal: true

FactoryBot.define do
  factory :company_branch do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    admin
  end
end
