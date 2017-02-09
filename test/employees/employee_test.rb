require './test/test_helper'

class LohnmangerEmployeeTest < Minitest::Test

  def setup
    Lohnmanger.reset!
    @client = api_token_client
  end

  def teardown
    Lohnmanger.reset!
  end

  def test_returns_employees
    VCR.use_cassette('all_employees') do
      employees = @client.all_employees
      assert_kind_of Array, employees
    end
  end

  def test_returns_employee_by_number
    VCR.use_cassette('employee_by_number') do
      employee = @client.employee(99892)
      assert_kind_of Sawyer::Resource, employee
      assert_equal 99892, employee.EmployeeNo
    end
  end

end

