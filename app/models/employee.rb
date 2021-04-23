# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company_branch
  has_many :logs

  before_create :generate_private_number

  validates :private_number, uniqueness: true

  private

  def generate_private_number
    self.private_number = SecureRandom.hex(3).upcase
  end
end
