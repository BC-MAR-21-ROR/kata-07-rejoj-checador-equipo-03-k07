class CompanyBranch < ApplicationRecord
  validates :name, :address, presence: true
  belongs_to :admin
  has_many :employees, dependent: :delete_all
end
