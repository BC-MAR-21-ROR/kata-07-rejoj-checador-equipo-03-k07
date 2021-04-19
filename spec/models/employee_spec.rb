require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:admin) do
    Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end
  let(:company_branch) do
    CompanyBranch.create!(name:'Foo', address:'Foo', admin_id: admin.id )
  end
  describe '#generate_private_number' do
    context 'Before employee is created' do
      it 'generate a private number' do
        employee = Employee.new(company_branch_id: company_branch.id)
        expect(employee.private_number).to be_nil
        employee.save!
        expect(employee.private_number).to be_present
      end
    end
  end
end
