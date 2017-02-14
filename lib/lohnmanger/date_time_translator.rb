require 'chronic'

module Lohnmanger
  module DateTimeTranslator

    class << self

      def to_wcf(date_string)
        # provided a json date format e.g. "2017-02-08T10:00:00+01:00"
        unix = Chronic.parse(date_string).to_i * 1000
        wcf = "\/Date(#{unix})\/"
        return wcf
      end

      def time_to_wcf(time_string)
        # provided a json datetime format e.g. "2017-02-08T22:12:00+01:00"
        # and return as "PT22H12M"
        datetime = Chronic.parse(time_string)
        hours = datetime.strftime("%-H")
        minutes = datetime.strftime("%-M")
        return "PT#{hours}H#{minutes}M"
      end

      # provided a wcf date format e.g. "\/Date(1480546800000+0100)\/"
      def from_wcf(date_string)
        matchdata =  /\/Date\((\d*).*/.match(date_string)
        unix = matchdata[1].to_i/1000
        datetime = Time.at(unix).iso8601
        return datetime
      end

      # convert json date format to WCF date format
      def json_time_records_to_wcf(records)
        records.map do |record|
          record[:RecordDate] = Lohnmanger::DateTimeTranslator.to_wcf(record[:RecordDate])
          record[:Shift1_Start] = Lohnmanger::DateTimeTranslator.time_to_wcf(record[:Shift1_Start])
          record[:Shift1_End] = Lohnmanger::DateTimeTranslator.time_to_wcf(record[:Shift1_End])
          record[:Shift2_Start] = Lohnmanger::DateTimeTranslator.time_to_wcf(record[:Shift2_Start]) if record[:Shift2_Start]
          record[:Shift2_End] = Lohnmanger::DateTimeTranslator.time_to_wcf(record[:Shift2_End]) if record[:Shift2_End]
          record
        end
      end

    end

    def configure
    end

  end
end
