# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Employee', type: :system do
	before do
    driven_by(:rack_test)
  end
	
  let(:admin) do
    FactoryBot.create(:admin)
  end
  let(:company_branch) do
    FactoryBot.create(:company_branch)
  end

  context 'cannot be created without field' do
    it 'name' do
      employee = Employee.new(name: '', email: 'drax@gmail.com', position: 'manager',
                              company_branch_id: company_branch.id)
      expect(employee.name).to eq ''
    end

    it 'email' do
      employee = Employee.new(name: 'Draxton Simmons', email: '', position: 'manager',
                              company_branch_id: company_branch.id)
      expect(employee.email).to eq ''
    end

    it 'position' do
      employee = Employee.new(name: 'Draxton Simmons', email: 'drax@gmail.com', position: '',
                              company_branch_id: company_branch.id)
      expect(employee.position).to eq ''
    end
  end

  # it 'created correctly' do
  #   new_employee(name: 'Draxton Simmons', email: 'drax@email.com', position: 'manager')
  #   expect(page).to have_content('Your employee has been created')
  # end
end
