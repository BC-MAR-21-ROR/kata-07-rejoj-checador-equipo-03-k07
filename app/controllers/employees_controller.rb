class EmployeesController < ApplicationController
  before_action :set_current_branch
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @pagy, @employees = pagy(@company_branch.employees, items: 10)
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
                  notice: 'Your company branch has been created'
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to company_branch_employees_path(@company_branch),
                  notice: 'Your company branch has been updated'
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:email, :name, :position, :employee_number, :private_number)
  end

  def set_employee
    @employee = @company_branch.employees.find(params[:id])
  end

  def set_current_branch
    @company_branch = CompanyBranch.find(params[:company_branch_id])
  end
end
