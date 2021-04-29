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
  scope :average_check, ->(check) { average(%(#{check}::time)) }

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
