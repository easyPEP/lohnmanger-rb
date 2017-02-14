require 'sawyer'
require_relative 'configurable'
require_relative 'date_time_translator'
require_relative 'client/employees'
require_relative 'client/employees_time_records'

module Lohnmanger

  class Client
    include Lohnmanger::DateTimeTranslator
    include Lohnmanger::Configurable
    include Lohnmanger::Client::Employees
    include Lohnmanger::Client::EmployeesTimeRecords

    def initialize(options = {})
      Lohnmanger::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Lohnmanger.instance_variable_get(:"@#{key}"))
      end
    end

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    # Make a HTTP POST request
    #
    # @param url [String] The path, relative to {#api_endpoint}
    # @param options [Hash] Body and header params for request
    # @return [Sawyer::Resource]
    def post(url, options = {})
      request :post, url, options
    end

    def agent
      @agent ||= Sawyer::Agent.new(@api_endpoint, sawyer_options) do |http|
        #http.headers[:accept] = "application/json"
        #http.headers[:user_agent] = "Lohnmanager Ruby Gem".freeze
        #http.params = http.params.merge application_authentication
        http.headers[:content_type] = "application/json"
      end
    end

    def application_authentication
      { apiKey: @apiKey, companyNo: @companyNo }
    end

    def sawyer_options
      opts = {
        faraday: Faraday.new
      }
      opts
    end

    def apiKey=(value)
      reset_agent
      @apiKey = value
    end

    def companyNo=(value)
      reset_agent
      @companyNo = value
    end

    private

    def reset_agent
      @agent = nil
    end

    def request(method, path, data, options = {})
      data.merge! application_authentication
      @last_response = response = agent.call(method, URI::Parser.new.escape(path.to_s), data, options)
      response.data
    end

  end
end
