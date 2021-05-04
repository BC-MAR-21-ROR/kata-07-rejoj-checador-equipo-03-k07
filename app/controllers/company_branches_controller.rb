class CompanyBranchesController < ApplicationController
  before_action :set_current_branch, only: %i[edit update destroy]

  def index
    @pagy, @company_branches = pagy(CompanyBranch.all, items: 10)
  end

  def new
    @company_branch = CompanyBranch.new
  end

  def create
    @company_branch = CompanyBranch.new(company_params)
    @company_branch.admin_id = current_admin.id
    if @company_branch.save
      redirect_to company_branches_path, flash: { success: 'Successfully created company branch' }
    else
      render :new
    end
  end

  def edit; end

  def update
    @company_branch.update(company_params)

    redirect_to company_branches_path, flash: { success: 'Your company branch has been updated' }
  end

  def destroy
    @company_branch.destroy
    redirect_to company_branches_path, flash: { success: 'Your company branch has been deleted' }
  end

  private

  def set_current_branch
    @company_branch = CompanyBranch.find(params[:id])
  end

  def company_params
    params.require(:company_branch).permit(:name, :address)
  end
end
