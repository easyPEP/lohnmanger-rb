module Lohnmanger
  class Client
    module EmployeesTimeRecords
      # "TimeRecords":[
      #   {
      #     "EmployeeNo":5,
      #     "RecordDate":"\/Date(1480546800000+0100)\/",
      #     "Shift1_End":"PT2H25M",
      #     "Shift1_Start":"PT1H10M",
      #     "Shift2_End":"PT23H30M",
      #     "Shift2_Start":"PT22H23M",
      #     "Break":null,
      #     "RecordType":0,
      #     "Credit":null,
      #     "CreditDay":null,
      #     "ExpensesCredit":null,
      #     "FortyFourEuro":null,
      #     "Holiday":null,
      #     "Meals":null,
      #     "TimeAccountBalance":null,
      #     "VariableWageType1":null,
      #     "VariableWageType2":null
      #   }
      # ]
      # options => Array[]
      def create_employees_time_records(options = {})
        result = post('UpdateEmployeesTimeRecords', {TimeRecords: Lohnmanger::DateTimeTranslator.json_time_records_to_wcf(options)})
        result['UpdateEmployeesTimeRecordsResult']
      end

    end
  end
end
