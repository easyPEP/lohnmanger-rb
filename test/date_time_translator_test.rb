require './test/test_helper'

class DateTimeTranslatorTest < Minitest::Test

  def test_to_wcf
    date_string = "2017-02-08T10:00:00+01:00"
    wcf = Lohnmanger::DateTimeTranslator.to_wcf(date_string)
    unix = Chronic.parse(date_string).to_i * 1000
    assert_equal wcf, "\/Date(#{unix})\/"
  end

  def test_time_to_wcf
    time_string = "2017-02-08T23:01:00+01:00"
    wcf = Lohnmanger::DateTimeTranslator.time_to_wcf(time_string)
    assert_equal wcf, "PT23H1M"
  end

  def test_explicit_time_to_wcf
    time_string = "23:01"
    wcf = Lohnmanger::DateTimeTranslator.time_to_wcf(time_string)
    assert_equal wcf, "PT23H1M"
  end

  def test_from_wcf
    date_string = "\/Date(1480546800000+0100)\/"
    iso8601 = Lohnmanger::DateTimeTranslator.from_wcf(date_string)
    assert_equal iso8601, "2016-12-01T00:00:00+01:00"
  end

  def test_time_records_to_wcf
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
    wcf_formatted = Lohnmanger::DateTimeTranslator.json_time_records_to_wcf(time_records)
    record = wcf_formatted.first
    assert_equal record[:RecordDate], "\/Date(1480546800000)/"
    assert_equal record[:Shift1_Start], "PT8H1M"
    assert_equal record[:Shift1_End], "PT10H21M"
    assert_equal record[:Shift2_Start], "PT14H30M"
    assert_equal record[:Shift2_End], "PT23H22M"
  end

end
