require 'faraday'
require 'json'

BASE_API_URL = "https://api.lohnmanager.info/LohnManagerService.svc/json"

module Lohnmanger
  class Base

    def self.post(path, params)
      auth_params = {
        apiKey: @options.apiKey,
        companyNo: @options.companyNo
      }
      params_with_auth = params.merge!(auth_params)
      connection.post "/#{path}", params_with_auth
    end

    def self.connection(url)
      conn = Faraday.new(url: BASE_API_URL) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

  end
end
