module CapybaraEmployeeHelper
  def new_employee(as: nil, name: nil, email: nil, position: nil)
    visit new_company_branch_employee_path(:company_branch_id)
    # within(:xpath, './/div[@id="employee_number"]') do
    # end
    page.fill_in 'employee_name', with: name	|| as&.name
    page.fill_in 'employee_email', with: email	|| as&.email
    page.fill_in 'employee_position', with: position	|| as&.position
    
    click_on 'Save'
  end

  def edit_employee(as: nil, name: nil, email: nil, position: nil)
    visit edit_company_branch_employee_path(:company_branch_id, :employee_id)

    fill_in 'Name', with: name	|| as&.name
    fill_in 'Email', with: email	|| as&.email
    fill_in 'Position', with: position	|| as&.position

    click_on 'Save'
  end
end
