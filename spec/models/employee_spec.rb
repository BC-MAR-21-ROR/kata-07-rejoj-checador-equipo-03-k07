# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:admin) do
    Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end
  let(:company_branch) do
    CompanyBranch.create!(name: 'Foo', address: 'Foo', admin_id: admin.id)
  end

  describe 'associations' do
    it { should belong_to(:company_branch).class_name('CompanyBranch') }
    it { should have_many(:logs).class_name('Log') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:position) }
  end

  describe '#generate_private_number' do
    context 'Private number is generated before employee' do
      it 'is not nil or empty' do
        employee = Employee.new(name: 'Draxton Simmons', email: 'drax@gmail.com', position: 'manager',
                                company_branch_id: company_branch.id)
        expect(employee.private_number).to be_nil
        employee.save!
        expect(employee.private_number).to be_present
      end
    end
  end

  describe '#generate_employee_number' do
    context 'Employee number is generated before employee' do
      it 'is not nil or empty' do
        employee = Employee.new(name: 'Draxton Simmons', email: 'drax@gmail.com', position: 'manager',
                                company_branch_id: company_branch.id)
        expect(employee.employee_number).to be_nil
        employee.save!
        expect(employee.employee_number).to be_present
      end
    end
  end

  describe '#showing company branch employees' do
    context 'user only sees specified branch employees' do
      it 'employee company branch id is equal company branch id' do
        employee = Employee.new(name: 'Draxton Simmons', email: 'drax@gmail.com', position: 'manager',
                                company_branch_id: company_branch.id)
        employee.save!
        expect(employee.company_branch_id).to be_equal company_branch.id
      end
    end
  end
end
