require './test/test_helper'

class EmployeesTimeRecordsTest < Minitest::Test

  def setup
    Lohnmanger.reset!
    @client = api_token_client
  end

  def teardown
    Lohnmanger.reset!
  end

  def test_create_employees_time_records
    VCR.use_cassette('create_employees_time_records') do

      time_records = [
        {
          "EmployeeNo":5,
          "RecordType":0,
          "RecordDate":"\/Date(1480546800000+0100)\/",
          "Shift1_Start":"PT1H10M",
          "Shift1_End":"PT2H25M",
          "Shift2_Start":"PT22H23M",
          "Shift2_End":"PT23H30M"
        }
      ]

      records = @client.create_employees_time_records(time_records)
      assert_kind_of Array, records
    end
  end

end

