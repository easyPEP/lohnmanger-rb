module Lohnmanger
  class Client
    module Employees

      def all_employees
      	result = post('GetAllEmployees')
      	result['GetAllEmployeesResult']
      end

      def employee(employee_id)
      	result = post('GetEmployeeByNo', EmployeeNo: employee_id)
      	result['GetEmployeeByNoResult']
      end

    end
  end
end
