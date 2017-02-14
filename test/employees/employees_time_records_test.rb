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
          "EmployeeNo": 5,
          "RecordType": 0,
          "RecordDate": "2016-12-01T00:00:00+01:00",
          "Shift1_Start": "08:01",
          "Shift1_End": "10:21",
          "Shift2_Start": "14:30",
          "Shift2_End": "23:22"
        }
      ]
      records = @client.create_employees_time_records(time_records)
      assert_kind_of Array, records
    end
  end

  def test_create_employees_time_records_with_only_one_shift
    VCR.use_cassette('create_employees_time_records_with_only_one_shift') do

      time_records = [
        {
          "EmployeeNo": 5,
          "RecordType": 0,
          "RecordDate": "2016-12-01T00:00:00+01:00",
          "Shift1_Start": "08:01",
          "Shift1_End": "10:21",
        }
      ]
      records = @client.create_employees_time_records(time_records)
      assert_kind_of Array, records
    end
  end

end
