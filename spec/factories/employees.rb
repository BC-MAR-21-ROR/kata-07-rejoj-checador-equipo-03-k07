# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    position { Faker::Job.position }
    state { [true, false].sample }

    company_branch
  end
end
