# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @attendances = attendance
  end

  def show
    return unless params[:report] == 'attendance'

    @attendances = attendance
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
        company_branch_name: log.employee.company_branch.name
      }
    end
    @logs_by_day.sort_by! { |log| log[:company_branch_name] }
  end
end
