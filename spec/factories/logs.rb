# frozen_string_literal: true

FactoryBot.define do
  factory :log do
    check_in do
      Faker::Time.between_dates(
        from: Date.today.beginning_of_year,
        to: Date.today,
        period: :morning
      )
    end
    check_out do
      Faker::Time.between_dates(
        from: check_in,
        to: check_in.end_of_day,
        period: :evening
      )
    end
    employee
  end
end
