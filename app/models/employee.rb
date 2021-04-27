# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company_branch
  has_many :logs

  before_create :generate_private_number, :generate_employee_number

  validates :name, :email, :position, presence: true
  validates :private_number, uniqueness: true
  validates :email, uniqueness: true


  private

  def generate_private_number
    self.private_number = SecureRandom.hex(3).upcase
  end

  def generate_employee_number
    self.employee_number = rand(100..1000)
  end

end
