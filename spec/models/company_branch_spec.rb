require 'rails_helper'

RSpec.describe CompanyBranch, type: :model do
  describe 'associations' do
    it { should belong_to(:admin).class_name('Admin') }
    it { should have_many(:employees).class_name('Employee') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end
end
