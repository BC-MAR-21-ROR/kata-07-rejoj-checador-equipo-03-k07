# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :employee

  validate :one_check_in_by_day, on: :create
  validate :one_check_out_by_day, on: :update

  scope :by_day, ->(date) { where(check_in: date) }
  scope :by_month, ->(date) { where(check_in: date.beginning_of_month..date.end_of_month) }
  scope :by_company_branch, lambda { |company_branch_id|
    joins(:employee).where(employee: { company_branch_id: company_branch_id })
  }
  scope :by_employee, ->(employee_id) { where(employee_id: employee_id) }
  scope :average_time, ->(check) { average(%(#{check}::time)) }
  scope :absence_by_month, lambda { |date|
    by_month(date).joins(:employee).select(
      %('#{date.strftime('%b %Y')}' AS "Month",employees.id, employees.name, #{workdays(date)} - count(*) as absence)
    ).group('employees.id')
  }

  def self.attendance(date)
    @logs_by_day = by_day(date).map do |log|
      {
        date: date,
        employee_id: log.employee.id,
        employee_name: log.employee.name,
        company_branch_name: log.employee.company_branch.name
      }
    end
    @logs_by_day.sort_by! { |log| log[:company_branch_name] }
  end

  def self.average_check(date)
    [
      {
        month: date.strftime('%b %Y'),
        company_branch: %(total : #{CompanyBranch.count}),
        check_in: Time.at(by_month(date).average_time('check_in')).to_s(:time),
        check_out: Time.at(by_month(date).average_time('check_out')).to_s(:time)
      }
    ]
  end

  def self.absence(date)
    absence_by_month(date).map(&:attributes)
  end

  def self.workdays(date)
    (date.beginning_of_month..date.end_of_month).count(&:on_weekday?)
  end

  def one_check_in_by_day
    range = Time.now.beginning_of_day..Time.now.end_of_day
    error = 'check in already exist'
    errors.add :base, error if employee.logs.exists?(check_in: range)
  end

  def one_check_out_by_day
    range = Time.now.beginning_of_day..Time.now.end_of_day
    error = 'check out already exist'
    errors.add :base, error if employee.logs.exists?(check_out: range)
  end
end
