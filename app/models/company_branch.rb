class CompanyBranch < ApplicationRecord
  belongs_to :admin
  has_many :employees, dependent: :delete_all
end
