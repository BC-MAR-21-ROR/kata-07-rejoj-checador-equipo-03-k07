class EmployeesController < ApplicationController
  before_action :set_current_branch
  before_action :set_employee, only: %i[ show edit update destroy change_state]

  def index
    @pagy, @employees = pagy(@company_branch.employees, items: 10)
    @employees = @company_branch.employees.order(state: :desc)
  end

  def show; end

  def new
    @employee = @company_branch.employees.build
  end

  def edit; end

  def create
    @employee = @company_branch.employees.build(employee_params)
    if @employee.save
      redirect_to company_branch_employees_path(@company_branch),
                  flash: { success: 'Your employee has been created' }
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to company_branch_employees_path(@company_branch),
                  flash: { success: 'Your employee has been updated' }
    else
      flash[:error] = 'Your employee couldn\'t be updated'
      render :edit
    end
  end

  def change_state
    if @employee.toggle(:state).save
      flash[:success] = %(Employee "#{@employee.name}" has been #{@employee.state ? 'enabled' : 'disabled'})
    else
      flash[:error] = %(Employee couldn't be updated)
    end
    redirect_to company_branch_employees_path(@company_branch)
  end

  private
  def employee_params
    params.require(:employee).permit(:email, :name, :position, :employee_number, :private_number, :state)
  end

  def set_employee
    @employee = @company_branch.employees.find(params[:id])
  end

  def set_current_branch
    @company_branch = CompanyBranch.find(params[:company_branch_id])
  end
end
