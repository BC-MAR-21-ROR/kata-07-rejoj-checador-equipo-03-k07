# frozen_string_literal: true

class LogsController < ApplicationController

  skip_before_action :authenticate_admin!

  before_action :find_employee, only: :create

  def new; end

  def create
    @log = Log.create(check_in: Time.now, employee_id: @employee.id)
    if @log.persisted?
      flash[:success] = 'Employee check success'
    else
      flash[:error] = @log.errors.full_messages.join(', ')
    end
    redirect_to new_log_path
  end

  private

  def find_employee
    @employee = Employee.find_by(private_number: params[:private_number])
    redirect_to new_log_path, flash: { error: 'Invalid private number' } unless @employee
  end
end
