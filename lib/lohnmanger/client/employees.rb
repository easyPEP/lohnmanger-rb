module Lohnmanger
  class Client
    module Employees

      def all_employees
      	result = post('GetAllEmployees')
      	result['GetAllEmployeesResult']
      end

      def employee(employee_id)
      	post('GetEmployeeByNo', EmployeeNo: employee_id)
      end

    end
  end
end
