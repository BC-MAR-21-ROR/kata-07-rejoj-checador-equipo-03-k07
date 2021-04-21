# frozen_string_literal: true

class LogsController < ApplicationController
  skip_before_action :authenticate_admin!

  before_action :find_employee, only: :create
  before_action :find_log_type, only: :create

  def new
    @log_type = params['log_type'] || 'check-in'
  end

  def create
    if @log.errors.empty?
      flash[:success] = %{Employee #{params[:log_type]} success}
    else
      flash[:error] = @log.errors.full_messages.join(', ')
    end
    redirect_to new_log_path(log_type: 'check-out')
  end

  private

  def find_employee
    @employee = Employee.find_by(private_number: params[:private_number])
    redirect_to new_log_path, flash: { error: 'Invalid private number' } unless @employee
  end

  def find_log_type
    if params[:log_type] == 'check-in'
      @log = @employee.logs.create(check_in: Time.now)
    else
      @log = @employee.logs.find_by(check_in: Time.now.beginning_of_day..Time.now.end_of_day)
      @log.update(check_out: Time.now)
    end
  end
end
