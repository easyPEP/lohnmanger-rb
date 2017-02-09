# Lohnmanger-rb

http://api.lohnmanager.malta.obfr-dev.de/Documentation/#zeiterfassung

## Installation

Add this line to your application's Gemfile:

    gem 'lohnmanger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lohnmanger

## Usage

To get access to the cars for sale on Ben's Benzes, you would do this:

```ruby
require 'lohnmanger'

client = Lohnmanger::Client.new(
  apiKey: "xxxx",
  companyNo: 123
)

# Find all the Employees
employees = client.all_employees

# Find a Employee by id
employee = client.employee(68)

# Create Employee TimeRecord
time_records = [{
  "EmployeeNo":5,
  "RecordType":0,
  "RecordDate":"\/Date(1480546800000+0100)\/",
  "Shift1_Start":"PT1H10M",
  "Shift1_End":"PT2H25M",
  "Shift2_Start":"PT22H23M",
  "Shift2_End":"PT23H30M"
}]

result = client.create_employees_time_records(time_records)
```

### Lohnmanager Example Curl Requests

API:

curl -H 'Content-Type: application/json' -d '{
    "EmployeeNo": 1,
    "apiKey": "API-KEY",
    "companyNo": -1
  }'
  http://api.lohnmanager.malta.obfr-dev.de/LohnManagerService.svc/json/GetEmployeeByNo


curl -H 'Content-Type: application/json' -d '{
      "apiKey": "API-KEY",
      "companyNo": -1
  }' http://api.lohnmanager.malta.obfr-dev.de/LohnManagerService.svc/json/GetAllEmployees


curl -H 'Content-Type: application/json' -d '{
      "EmployeeNo": "99874",
      "apiKey":
      "API-KEY", "companyNo": -1
  }' http://api.lohnmanager.malta.obfr-dev.de/LohnManagerService.svc/json/UpdateEmployeesTimeRecords


curl -H 'Content-Type: application/json' -d '{
      "TimeProfile": {
        "StartValidity":"\/Date(1454281200000+0100)\/",
        "EmployeeNo": 1
      },
      "apiKey": "API-KEY",
      "companyNo": -1
    }' http://api.lohnmanager.malta.obfr-dev.de/LohnManagerService.svc/json/CreateEmployeesTimeprofile
