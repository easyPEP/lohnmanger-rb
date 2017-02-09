module Lohnmanger
  class Client
    module EmployeesTimeRecords
      # [
      #   {
      #     "Break":null,
      #     "Credit":null,
      #     "CreditDay":null,
      #     "EmployeeNo":5,
      #     "ExpensesCredit":null,
      #     "FortyFourEuro":null,
      #     "Holiday":null,
      #     "Meals":null,
      #     "RecordDate":"\/Date(1480546800000+0100)\/",
      #     "RecordType":0,
      #     "Shift1_Start":"PT1H10M",
      #     "Shift1_End":"PT2H25M",
      #     "Shift2_Start":"PT22H23M",
      #     "Shift2_End":"PT23H30M",
      #     "TimeAccountBalance":null,
      #     "VariableWageType1":null,
      #     "VariableWageType2":null
      #   }
      # ]
      def create_employees_time_records(options = {})
        result = post('UpdateEmployeesTimeRecords', {TimeRecords: options})
        result['UpdateEmployeesTimeRecordsResult']
      end

    end
  end
end
