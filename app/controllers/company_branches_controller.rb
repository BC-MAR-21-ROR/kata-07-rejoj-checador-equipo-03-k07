class CompanyBranchesController < ApplicationController
  
  def index
    @company_branches = CompanyBranch.all
  end
end
