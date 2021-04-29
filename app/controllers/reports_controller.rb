# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @results = attendance
  end

  def show
    case params[:report]
    when 'attendance'
      @results = attendance
    when 'average_check'
      @results = average_check
    when 'absence'
      @results = absence
    else
      return render file: %(#{Rails.root}/public/404.html), layout: false, status: 404
    end
    render :index
  end

  private

  def date
    @date ||= params[:date] ? Date.parse(params[:date]) : Date.yesterday
  end

  def attendance
    @logs_by_day = Log.by_day(date).map do |log|
      {
        employee_id: log.employee.id,
        employee_name: log.employee.name,
        company_branch_name: log.employee.company_branch.name,
        date: date
      }
    end
    @logs_by_day.sort_by! { |log| log[:company_branch_name] }
  end

  def average_check
    [
      {
        company_branch: %(total : #{CompanyBranch.count}),
        check_in: Time.at(Log.by_month(date).average_check('check_in')).to_s(:time),
        check_out: Time.at(Log.by_month(date).average_check('check_out')).to_s(:time)
      }
    ]
  end

  def absence
    Log.absence_by_month(date).map(&:attributes)
  end
end
