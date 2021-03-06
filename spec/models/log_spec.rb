require 'rails_helper'

RSpec.describe Log, type: :model do
  let(:admin) do
    Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end
  let(:company_branch) do
    FactoryBot.create(:company_branch, admin: admin)
  end
  let(:employee) do
    FactoryBot.create(:employee, company_branch_id: company_branch.id)
  end
  describe '#one_check_in_by_day' do
    context 'When a employee does check in' do
      it 'only must allow one by day' do
        expect {
          Log.create(check_in: Time.now, employee_id: employee.id)
          Log.create(check_in: Time.now, employee_id: employee.id)
        }.to change(Log, :count).by(1)
      end
    end
  end
  describe '#one_check_out_by_day' do
    context 'When a employee does check out' do
      it 'only must allow one by day' do
        @log = Log.create(check_in: Time.now, employee_id: employee.id)
        @log.update(check_out: Time.now)
        expect { @log.update!(check_out: Time.now) }.to raise_error(
          ActiveRecord::RecordInvalid,
          'Validation failed: check out already exist'
        )
      end
    end
  end
end
